# Maintainer: inhzus <inhzus@gmail.com>
pkgname=cppinsights-git
pkgver=r720.8612ae5
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
groups=()
depends=(llvm-libs clang llvm)
makedepends=('git' 'sed' 'ninja')
provides=("cppinsights")
conflicts=("cppinsights")
replaces=()
backup=()
options=()
# install=
source=("$pkgname::git+https://github.com/andreasfertig/cppinsights.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
    cmake -G"Ninja" -B build -DCLANG_LINK_CLANG_DYLIB=1 -DLLVM_LINK_LLVM_DYLIB=1 -DINSIGHTS_USE_SYSTEM_INCLUDES=OFF .
    cmake --build build -j
}

package() {
	cd "$srcdir/${pkgname}/build"
    install -Dm755 "insights" "${pkgdir}/usr/bin/insights"
}

