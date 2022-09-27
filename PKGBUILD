# Maintainer: LordMZTE <lord at mzte dot de>

_pkgname=gpower2

pkgname="${_pkgname}-git"
pkgver=r18.2f06314
pkgrel=1
pkgdesc="A simple power dialog written in zig using gtk4"
url="https://mzte.de/git/LordMZTE/gpower2"
license=('GPL-3')
depends=('gtk4' 'systemd')
makedepends=('git' 'zig')
arch=('x86_64')
provides=('gpower2')
conflicts=('gpower2')
source=(
  "git+https://mzte.de/git/LordMZTE/gpower2.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgname}"
  zig build -Drelease-fast=true
}

package() {
  cd "${srcdir}/${_pkgname}"
  zig build -p ${pkgdir}/usr -Drelease-fast=true
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 man/gpower2.1 "${pkgdir}/usr/share/man/man1/gpower2.1"
  install -D -m644 man/gpower2.5 "${pkgdir}/usr/share/man/man5/gpower2.5"
}
