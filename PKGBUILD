# Maintainer: Rustem B. <rustemb@systemli.org>

pkgname=sic-image-cli-git
pkgver=0.11.0.r2.g670901f
pkgrel=1
pkgdesc="Convert images and perform image operations from the command-line."
arch=(x86_64)
url="https://github.com/foresterre/sic"
license=('MIT')
groups=()
depends=()
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=(sic)
conflicts=(sic)
replaces=()
source=("$pkgname::git+https://github.com/foresterre/sic.git")
md5sums=("SKIP")

pkgver() {
	cd "${pkgsrc}/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgsrc}/$pkgname"
	cargo build --release
}


check() {
	cd "${pkgsrc}/$pkgname"
	cargo test --release
}

package() {
	cd "${pkgsrc}/$pkgname"
	install -Dm755 "${srcdir}/${pkgname}/target/release/sic" "${pkgdir}/usr/bin/sic"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/sic/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/sic/LICENSE"
	install -Dm644 "thanks/dependency_licenses.txt" "${pkgdir}/usr/share/licenses/sic/DEPS_LICENSES"
}
