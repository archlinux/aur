# Maintainer: FLX (Paul Werther) <flx@evait.de>
pkgname=rusthound-git
_pkgname=${pkgname%-git}
pkgver=f79ea96
pkgrel=1
pkgdesc="RustHound is a cross-platform BloodHound collector tool written in Rust, making it compatible with Linux, Windows, and macOS."
arch=('any')
url="https://github.com/OPENCYBER-FR/RustHound"
license=("MIT")
makedepends=("git" "cargo" "clang")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	cargo build --release
}

package() {
	install -Dm644 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
