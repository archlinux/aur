# Maintainer: Justin Wong <jusw85 at hotmail dot com>

pkgname=mrifk-git
_pkgname=mrifk
pkgver=3.r0.g48687e5
pkgrel=1
pkgdesc='Decompiles Glulx story files'
arch=('x86_64' 'i686')
url='https://github.com/wertercatt/mrifk'
license=('GPL')
depends=('gmp' 'libffi')
makedepends=('git' 'ghc' 'ghc-static')
source=('git+https://github.com/wertercatt/mrifk.git'
        'Makefile.patch')
sha256sums=('SKIP'
            '91fb77f8af044004758d6b1d0547aacf4937ba3d4712538f351554139af05537')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch --strip=1 --input="${srcdir}/Makefile.patch"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m755 mrifk ${pkgdir}/usr/bin/mrifk
}
