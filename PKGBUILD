# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf
_reponame=TermPDF
_executable=termpdf
pkgver=0.3.1
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
sha256sums=('4cba7fe5983fe7dc5544817740da8ba77e28309a9ee35314296631bb262c7c98')

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
