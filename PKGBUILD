# Maintainer: haxibami <contact at haxibami dot net>

pkgname=typst-live-git
_pkgname=typst-live
pkgver=r33.4987e17
pkgrel=1
pkgdesc="A simple utility to watch for changes in your typst file and automatically recompile them"
arch=('any')
url="https://github.com/ItsEthra/typst-live"
license=("MIT")
makedepends=('git' 'cargo')
source=(
  "git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cargo fetch
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "./target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
