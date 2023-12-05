# Maintainer: Simon Marchi <simon.marchi at polymtl dot ca>
# Contributor: inhzus <inhzus at gmail dot com>.
pkgname=cppinsights
pkgver=0.10
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
depends=(llvm-libs llvm clang)
makedepends=('ninja')
conflicts=("cppinsights-git")
source=("https://github.com/andreasfertig/cppinsights/archive/refs/tags/v_0.10.tar.gz")
b2sums=('b0e48cd3d95556d48b84333c16cd20b282c8fe77d29f422961f9d89ad5858a32c4878ee7236a821e03f4b5523bb21987085a6cdd8bb052e9585688c646e8bc39')

build() {
	cd "${srcdir}/${pkgname}-v_${pkgver}"
	cmake -G"Ninja" -B build -DCLANG_LINK_CLANG_DYLIB=1 -DLLVM_LINK_LLVM_DYLIB=1 -DINSIGHTS_USE_SYSTEM_INCLUDES=OFF .
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}-v_${pkgver}/build"
	install -Dm755 "insights" "${pkgdir}/usr/bin/insights"
}


