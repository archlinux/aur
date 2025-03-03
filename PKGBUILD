# Maintainer: Simon Marchi <simon.marchi at polymtl dot ca>
# Contributor: inhzus <inhzus at gmail dot com>.
pkgname=cppinsights
pkgver=19.1
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
depends=(llvm-libs llvm clang)
makedepends=('ninja')
conflicts=("cppinsights-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andreasfertig/cppinsights/archive/refs/tags/v_${pkgver}.tar.gz")
b2sums=('e22c763249314be3ae1296e75c7dd1ffd6b0c478a02cb23c7e7e7f675a7d26f34b191fe63446898ba6177d963a71d9c15c09f20f547898a4ed3c18091facfd9f')

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
