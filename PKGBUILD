# Maintainer: CosmicHeron <dev cosmicheron com>

_bin='ziso'
_pkgbase="${_bin}_compressor"
pkgname="${_pkgbase}-git"
pkgdesc='A simple ZISO compressor'
url='https://github.com/Danixu/ziso_compressor'
license=('Apache-2.0')
pkgver='r81.e56b86f'
pkgrel='2'
arch=('x86_64' 'aarch64')
provides=("$_bin")
conflicts=("$_bin")
makedepends=('cmake' 'git' 'make')
source=("${_pkgbase}::git+${url}.git")
b2sums=('SKIP')
install="${pkgname}.install"
_pkgsrc="${srcdir}/${_pkgbase}"

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	git -C "$_pkgbase" submodule update --init
}

build() {
	cmake -S "$_pkgbase" -B "${_pkgbase}/build"
	make -C "${_pkgbase}/build"
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgbase}/build/bin/${_bin}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgbase}/LICENSE"
}
