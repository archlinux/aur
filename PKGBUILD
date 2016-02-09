# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=findnewest-git
pkgver=0.3.12.be44060
pkgrel=1
pkgdesc='Recursively find newest file in a hierarchy and print its timestamp'
url='https://github.com/0-wiz-0/findnewest'
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('findnewest')
conflicts=('findnewest')
source=(${pkgname}::git+https://github.com/0-wiz-0/findnewest)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed -r 's|(findnewest-)?(.+)|\2|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
