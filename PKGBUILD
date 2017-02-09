# $Id: PKGBUILD 173345 2016-05-02 12:36:00Z ronald $
# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: Alexander Rødseth <rodseth at gmail dot com>
# Contributor: William Rea <sillywilly at gmail dot com>

_pkgname=libmatio
pkgname=libmatio-git
pkgver=1.5.9.27.ge57c66f
pkgrel=1
pkgdesc='C library with a fortran 90/95 module interface for reading/writing MATLAB MAT-files'
arch=('x86_64' 'i686')
license=('custom:BSD')
url='https://github.com/tbeu/matio'
depends=('zlib' 'hdf5')
options=('!libtool' '!emptydirs')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver () {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --with-hdf5
  make

  cd documentation
  find . -name "*.texi" -exec makeinfo {} \;
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
