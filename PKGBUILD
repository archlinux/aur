# Maintainer: Vincent Kobel (v@kobl.one)

_pkgname='bat'
pkgname="bat-cat-git"
pkgver=r205.c91511c
pkgrel=1
pkgdesc="A cat(1) clone with wings."
arch=('x86_64')
url='https://github.com/sharkdp/bat'
license=('Apache-2.0')
sha256sums=('SKIP')
source=("git+https://github.com/sharkdp/${_pkgname}")
provides=('bat')
makedepends=('git' 'rust')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D ./target/debug/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

