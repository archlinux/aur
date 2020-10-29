# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=fundoc-git
_pkgname=${pkgname%-git}
pkgver=r41.b65ee57
pkgrel=1
pkgdesc="Fundoc - the right way to generate documentation"
arch=('x86_64')
url="https://github.com/daynin/fundoc"
license=("MIT")
makedepends=("git" "cargo")
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
