# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=checkmake
pkgver=0.1.0.47
pkgrel=1
pkgdesc="Experimental linter/analyzer for makefiles"
arch=('any')
url="https://github.com/mrtazz/checkmake"
license=('MIT')
makedepends=('git' 'go')
conflicts=('checkmake-git')
source=("git+https://github.com/mrtazz/checkmake.git#commit=575315c")
sha256sums=('SKIP')

build(){
    cd "${srcdir}/${pkgname}"
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    make EXT_LDFLAGS="-linkmode external" GOFLAGS="-buildmode=pie -trimpath"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 checkmake "${pkgdir}/usr/bin/checkmake"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
