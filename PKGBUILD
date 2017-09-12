# $Id: PKGBUILD 105614 2014-02-11 18:34:38Z ttoepper $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Robbel <robbel@gmail.com>

pkgname=fswebcam
pkgver=20140113
pkgrel=1
pkgdesc="Tiny and flexible webcam app."
arch=('i686' 'x86_64')
url="http://www.firestorm.cx/fswebcam"
license=('GPL')
depends=('gd')
backup=("etc/$pkgname.conf")
source=("$url/files/$pkgname-$pkgver.tar.xz")
md5sums=('1bfdb21904e816f100370ec8f4df986b')
sha1sums=('6c1f3e3c8cf3189f0e2a5d4f8c9534c855c02e0a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Install configuration file
  # Commented to avoid problems with many devices, thank you SpepS
  sed "s_^_#_g" -i example.conf
  install -Dm644 example.conf "$pkgdir/etc/fswebcam.conf"
}

# vim:ts=2:sw=2:expandtab
