# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf
_reponame=TermPDF
_executable=termpdf
pkgver=0.4.2
pkgrel=1
pkgdesc="A terminal PDF viewer written in Rust, with vim key-bindings and watch mode."
arch=('x86_64' 'aarch64')
url="https://www.github.com/NiJingzhe/${_reponame}"
license=('MIT')
depends=('libpdfium')
makedepends=('git' 'cargo')
checkdepends=('cargo')
conflicts=('tpdf-git' 'tpdf-bin')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('fae74961f9f9546155368de057d4f91086323d44ee0eb75b30a978aa4cda4085')

build() {
	cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    TERMPDF_PDFIUM_VARIANT=SYSTEM cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    TERMPDF_PDFIUM_VARIANT=SYSTEM cargo test --frozen --all-features
}

package() {
	cd "${srcdir}/${_reponame}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_executable}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
