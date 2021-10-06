pkgname="paths-bookmarks-git"
pkgver=r47.6959d5b
pkgrel=1
pkgdesc="Save often used directories like bookmarks"
arch=("x86_64")
url="https://github.com/sproott/pat.hs"
license=("MIT")
makedepends=("git" "stack")
optdepends=()
provides=("paths-bookmarks")
source=("${pkgname}::git+https://github.com/sproott/pat.hs.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "bin"
  stack --local-bin-path "bin/" install
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install binary
  install -Dm755 "bin/paths" "${pkgdir}/usr/share/paths/paths"
  install -Dm755 "paths.sh" "${pkgdir}/usr/share/paths/paths.sh"

  # Install bash and zsh completions
  install -Dm644 "doc/completions/bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/paths"
}
