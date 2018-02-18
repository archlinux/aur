# Maintainer: taskie <t@skie.jp>

pkgname=satysfi-git
_pkgname=SATySFi
pkgver=r1306.baa8057
pkgrel=1
pkgdesc="A new typesetting system with a static type system"
arch=('x86_64')
url="https://github.com/gfngfn/SATySFi"
license=('LGPL3')
depends=('glibc')
optdepends=()
makedepends=('git' 'libx11' 'ocaml-findlib' 'opam' 'rsync' 'wget')
provides=("satysfi")
options=()
source=("git+https://github.com/gfngfn/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  git submodule update --init --recursive
  export OPAMROOT="${srcdir}/.opam"
  opam init --yes --no-setup
  eval "$(opam config env)"
  opam pin add --yes satysfi .
}

package() {
  cd "${_pkgname}"
  export OPAMROOT="${srcdir}/.opam"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${OPAMROOT}/system/bin/satysfi" "${pkgdir}/usr/bin/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
