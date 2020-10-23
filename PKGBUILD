# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=rsflex-git
_pkgname=${pkgname%-git}
pkgver=r23.05e8a74
pkgrel=1
pkgdesc="A super fast system information displayer written in Rust"
arch=('x86_64')
url="https://github.com/curlpipe/rsflex"
license=("MPL-2.0")
makedepends=("git" "cargo")
depends=("pciutils" "coreutils" "xorg-xrandr" "playerctl" "ttf-nerd-fonts-symbols")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "${_pkgname}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
