# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=openh264
pkgname=$_pkgname-git
pkgver=1.1.r2131.g30328b8
pkgrel=1
pkgdesc="Open Source H.264 Codec"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.openh264.org"
license=('BSD')
makedepends=('git' 'nasm')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/cisco/openh264.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i 's/PREFIX=\/usr\/local/PREFIX=\/usr/g' Makefile
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm755 h264dec "$pkgdir/usr/bin/h264dec"
  install -Dm755 h264enc "$pkgdir/usr/bin/h264enc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
