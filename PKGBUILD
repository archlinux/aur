# Maintainer: Stepanov Aleksey <base64 -d <<< "Ymx1ZWluZ3JlZW5AYmx1aWcuc3BhY2UK">

_pkgname=fzf-vjour
pkgname="${_pkgname}-git"
pkgver=r90.ea9489c
pkgrel=1
pkgdesc='A fzf-based journaling and notes application with CalDav support.'
arch=('any')
url="https://github.com/baumea/fzf-vjour"
license=('MIT')
depends=('fzf' 'awk' 'vdirsyncer' 'bash')
makedepends=('git' 'scdoc' 'make')
optdepends=('bat: for colorful previews' 'noto-fonts-emoji: for display emoji in fzf')
source=("${_pkgname}::git+https://github.com/blueingreen68/fzf-vjour")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "${_pkgname}"

	make build
}

package() {
	cd "${_pkgname}"

	make install ARCH_PKGDIR="$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
