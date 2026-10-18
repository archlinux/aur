# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=mdwatch
pkgname="${_pkgname}"
pkgver=0.2.9
pkgrel=1
pkgdesc="A simple CLI tool to live-preview Markdown files in your browser"
arch=('x86_64' 'aarch64')
url="https://github.com/vimlinuz/${_pkgname}"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::https://github.com/vimlinuz/${_pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('57ab614ec211aa51358f2ea509e5359d35811b357fc63843b5dacf8f3ba97982')

prepare() {
	cd "${_pkgname}-${pkgver}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_pkgname}-${pkgver}"
	cargo build --frozen --release
}

check() {
	cd "${_pkgname}-${pkgver}"
	cargo test --frozen --release
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
