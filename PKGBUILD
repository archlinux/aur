# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=mdproof

pkgname="${_pkgname}-git"
pkgver=r37.c87db7a
pkgrel=1
pkgdesc="A standalone markdown to PDF converter"
url="https://github.com/Geemili/mdproof"
makedepends=('cargo')
arch=('x86_64')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 target/release/mdproof "${pkgdir}/usr/bin/mdproof"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
