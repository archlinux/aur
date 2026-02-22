# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Rodrigodd
_pkgname=strace-tui
_cratename=${_pkgname}
_appname=${_pkgname}
pkgname=${_cratename}
pkgdesc="A terminal user interface (TUI) for visualizing and exploring strace output"

pkgver=1.0.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('Apache-2.0' 'MIT')

makedepends=('rust')
depends=('glibc' 'libgcc')

provides=("${_appname}")
conflicts=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('829b3726cff1e2d5495dfaebcece0ddc188367b34149020db3c2fb2ace4c4bf3')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
