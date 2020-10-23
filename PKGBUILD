# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=rymfony-git
_pkgname=${pkgname%-git}
pkgver=r185.751e78b
pkgrel=1
pkgdesc="A work-in-progress CLI tool built in Rust to mimic the Symfony CLI binary"
arch=('x86_64')
url="https://github.com/Orbitale/Rymfony"
license=("AGPL-3.0")
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
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
