# Maintainer: Simon Marchi <simon.marchi at polymtl dot ca>
# Contributor: inhzus <inhzus at gmail dot com>.
pkgname=cppinsights
pkgver=17.0
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
depends=(llvm-libs llvm clang)
makedepends=('ninja')
conflicts=("cppinsights-git")
source=("https://github.com/andreasfertig/cppinsights/archive/refs/tags/v_${pkgver}.tar.gz")
b2sums=('7ab07c00faa8e9299daf8ad559109126d37e4454bc56ca65331795d5454ac49743351989638a2c5e2c2676bf265602639083fae082cfa05df638166ad709acdc')

build() {
	cd "${srcdir}/${pkgname}-v_${pkgver}"
	cmake -G"Ninja" -B build -DCLANG_LINK_CLANG_DYLIB=1 -DLLVM_LINK_LLVM_DYLIB=1 -DINSIGHTS_USE_SYSTEM_INCLUDES=OFF .
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-v_${pkgver}/build"
	install -Dm755 "insights" "${pkgdir}/usr/bin/insights"
}


