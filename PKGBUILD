# Contributor: lowercase <mattias.giese@posteo.net>
# Maintainer: lowercase <mattias.giese@posteo.net>

pkgname=dedbae-git
_pkgname=dedbae
pkgver=1.0.0.1.r1.g87b08da
pkgrel=1
pkgdesc='Library and tools for manipulating Nintendo Switch file formats'
arch=('any')
url='https://gitlab.com/roothorick/dedbae'
license=('ISC')
depends=('glibc' 'mbedtls')
makedepends=('git')
provides=("dedbae")
source=('git+https://gitlab.com/roothorick/dedbae.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}"
    git submodule init
    git submodule update
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm 755 -t "${pkgdir}/usr/bin/" ./bin/*
    install -Dm 644 -t "${pkgdir}/usr/lib/" ./lib/libdedbae.a
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
