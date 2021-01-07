# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: Alexander Rødseth <rodseth at gmail dot com>
# Contributor: William Rea <sillywilly at gmail dot com>

pkgname=libmatio
pkgver=1.5.17
pkgrel=1
pkgdesc='C library with a fortran 90/95 module interface for reading/writing MATLAB MAT-files'
arch=('x86_64')
license=('custom:BSD')
url='https://sourceforge.net/projects/matio'
depends=('zlib' 'hdf5')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/matio/matio-${pkgver}.tar.gz")
changelog=ChangeLog
sha512sums=('af8ff11c7c44fea9ea6886e381f49ef9186946f3def98ad9695f2d5d1df045c35e8f4ceac12a44be397f7bbd708b4803762b5ce54c45b60a9f446d551c04f5d2')

build() {
  cd "matio-${pkgver}"
  ./configure --prefix=/usr --enable-shared --with-hdf5
  make
}

package() {
  cd "matio-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/share/info/dir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

