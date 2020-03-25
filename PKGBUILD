# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=pmy-git
_pkgname=${pkgname%-git}
pkgver=r326.d6b7ccb
pkgrel=1
pkgdesc="General purpose context-aware zsh completion engine powered by fuzzy finder."
arch=('any')
depends=('fzf' 'zsh')
makedepends=('go')
provides=("${_pkgname}")
url="https://github.com/relastle/pmy"
license=('MIT')
source=("${_pkgname}::git+https://github.com/relastle/pmy#branch=master")
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  go mod tidy
  go build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "pmy" "$pkgdir/usr/bin/pmy"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/pmy/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/docs/pmy/README.md"
}
