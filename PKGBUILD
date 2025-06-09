# Maintainer: Simon Marchi <simon.marchi at polymtl dot ca>
# Contributor: inhzus <inhzus at gmail dot com>.
pkgname=cppinsights
pkgver=20.1
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
depends=(llvm-libs llvm clang)
makedepends=('ninja')
conflicts=("cppinsights-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andreasfertig/cppinsights/archive/refs/tags/v_${pkgver}.tar.gz")
b2sums=('58a9224679415801959aa2dac22590bbe31022ad43b10bff744aa3b7b60cc15176bb7f158166a061c6989b9d6db704241c90cf2f08fba438bc6c9d6992ceaec1')

build() {
	cd "${srcdir}/${pkgname}-v_${pkgver}"
	cmake -G"Ninja" -B build -DCLANG_LINK_CLANG_DYLIB=1 -DLLVM_LINK_LLVM_DYLIB=1 -DINSIGHTS_USE_SYSTEM_INCLUDES=OFF .
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-v_${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "build"
	install -Dm755 "insights" "${pkgdir}/usr/bin/insights"
}
