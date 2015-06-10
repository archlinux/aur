# Contributor: Sergio Tridente <tioduke at gmail dot com>

_pkgname=piimg
pkgname=piimg-git
pkgver=27.e7ce4ad
pkgrel=1
pkgdesc="A utility for working with disk images, which are designed to be flashed onto a Raspberry Pi."
arch=('i686' 'x86_64')
url="https://github.com/alexchamberlain/piimg"
license=('MIT')
depends=('glibc' 'parted')
makedepends=('git' 'make')
conflicts=('piimg')
provides=('piimg')
source=('git://github.com/alexchamberlain/piimg.git#branch=master')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/${_pkgname}"
  make src
}

package() {
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/doc/piimg/
  install -gusers -oroot -m4750 "$srcdir/${_pkgname}"/src/piimg "$pkgdir"/usr/bin/
  install -m644 "$srcdir/${_pkgname}"/{LICENSE,README.md} "$pkgdir"/usr/share/doc/piimg/
}
