# Maintainer: gld1982ltd <gld1982ltd@gmail.com>

pkgname=bake-sl
pkgver=0.1.49
pkgrel=1
pkgdesc="An easy to use build system. Designed to be make/autotools for the 21st century. (with Semplice Linux patches)"
arch=('i686' 'x86_64')
url="https://launchpad.net/bake"
license=("GPL3")
provides=("${pkgname%-sl}")
conflicts=("${pkgname%}" "${pkgname%-sl}")
makedepends=('itstool' 'vala')
source=("https://launchpad.net/bake/0.1/${pkgver}/+download/bake-${pkgver}.tar.gz"
        "https://github.com/semplice/bake/compare/gir_lookup.patch"
        "https://github.com/semplice/bake/compare/python_version.patch"
)
md5sums=('20eda033c1482900da0cccfb90a77f6d'
         'SKIP'
         'SKIP'
)

prepare() {
	cd "$srcdir/${pkgname%-sl}-$pkgver"
	patch -p1 -i ${srcdir}/gir_lookup.patch
	patch -p1 -i ${srcdir}/python_version.patch
}

build() {
    cd "$srcdir/${pkgname%-sl}-$pkgver"
    make
    ./bake-bootstrap --configure install-directory="$pkgdir/"
}

package() {
    cd "$srcdir/${pkgname%-sl}-$pkgver" 
    ./bake-bootstrap install
}
