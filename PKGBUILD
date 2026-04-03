# shellcheck disable=all

# ======================================================================#
#
#
#     ██████╗ ██╗  ██╗ ██████╗ ██████╗ ██╗   ██╗██╗██╗     ██████╗
#     ██╔══██╗██║ ██╔╝██╔════╝ ██╔══██╗██║   ██║██║██║     ██╔══██╗
#     ██████╔╝█████╔╝ ██║  ███╗██████╔╝██║   ██║██║██║     ██║  ██║
#     ██╔═══╝ ██╔═██╗ ██║   ██║██╔══██╗██║   ██║██║██║     ██║  ██║
#     ██║     ██║  ██╗╚██████╔╝██████╔╝╚██████╔╝██║███████╗██████╔╝
#     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝
#
#          Maintainer: Guillermo Galavis <druxorey@proton.me>
#         Maintainer: Walter C. <contacto@waltercasanova.tech>
#              Maintainer: Lucas W. <strophox@gmail.com>
#
# ======================================================================#

_pkgname=tetro-tui
pkgname=${_pkgname}-git
pkgver=r568.6baf0f4
pkgrel=2
pkgdesc="A terminal-based but modern tetromino-stacking game that is very customizable and cross-platform."
arch=('x86_64' 'aarch64')
url="https://github.com/Strophox/tetro-tui"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!debug')

makedepends=('git' 'cargo')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${_pkgname}"
	
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "${_pkgname}"
	
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
