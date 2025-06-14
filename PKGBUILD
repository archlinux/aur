# Maintainer: Aleksey Steapanov <blueingreen@bluig.xyz>

_pkgname=fzf-vjour
pkgname="${_pkgname}-git"
pkgver="r13.73d40af"
pkgrel=1
pkgdesc='A fzf-based journaling and notes application with CalDav support.'
arch=('any')
url="https://github.com/baumea/fzf-vjour"
license=('MIT')
depends=('fzf' 'awk' 'vdirsyncer' 'bash')
makedepends=('git')
optdepends=('bat: for colorful previews' 'noto-fonts-emoji: for display emoji in fzf')
source=("${_pkgname}::git+https://github.com/baumea/fzf-vjour")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	bash -O xpg_echo ./scripts/build.sh
}

package() {
	cd "${_pkgname}"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 fzf-vjour "$pkgdir/usr/bin/fzf-vjour"
}
