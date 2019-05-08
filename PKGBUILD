# Maintainer: Mikaela Szekely <qyriad@gmail.com>
_pkgname=rust-latest
pkgname="${_pkgname}-git"
pkgver=1.2.2.r1.g81ef47e
pkgrel=1
pkgdesc="A CLI tool to determine the latest version of the Rust toolchain."
arch=('i686' 'x86_64')
url="https://github.com/dbeckwith/rust-latest"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver()
{
		cd "${srcdir}/${pkgname}"

		git describe --long | sed 's/^v// ; s/-/.r/ ; s/-/./'
}

build()
{
		cd "${srcdir}/${pkgname}"

		RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package()
{

		cd "${srcdir}/${pkgname}"
		install -Dm755 "target/release/rust-latest" "${pkgdir}/usr/bin/rust-latest"

		install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
		install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

