# Maintainer: Mark Hegreberg <mark@archlinux.org>

pkgname=mousse-git
_pkgname="${pkgname%-git}"
pkgver=r7.6d49375
pkgrel=1
pkgdesc='vim for your mouse'
arch=(x86_64)
url='https://github.com/rusmisel/mousse'
license=('MIT')
makedepends=(clang wayland-protocols wlr-protocols)
depends=(wayland)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!lto)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"

  make mousse
}


package() {
  cd "${_pkgname}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
