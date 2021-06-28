# Maintainer: Tobias Markus < tobias AT miglix DOT eu >

pkgname=clang-build-analyzer-git
pkgver=v1.2.0.r35.e121bf3
pkgrel=1
pkgdesc="Clang build analysis tool using -ftime-trace"
arch=(x86_64)
url="https://github.com/aras-p/ClangBuildAnalyzer"
license=('Unlicense')
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('clang-build-analyzer::git+https://github.com/aras-p/ClangBuildAnalyzer.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cmake -B build \
        -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
	cd "$srcdir/build"

    install -Dt "$pkgdir/usr/bin" ClangBuildAnalyzer
}

