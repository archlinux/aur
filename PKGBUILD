# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-mappy
_source=minimap2
pkgver=2.26
pkgrel=1
pkgdesc="Python interface to minimap2, a fast and accurate C program to align genomic and transcribe nucleotide sequences"
arch=('x86_64')
url="https://github.com/lh3/minimap2"
license=('MIT')
depends=(
         'python'
         'minimap2'
         'zlib'
         'glibc'
        )
makedepends=(
             'python-setuptools'
             'cython'
             'python-wheel'
            )

options=(!emptydirs)
source=(${_source}-${pkgver}.tar.gz::https://github.com/lh3/minimap2/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('f4c8c3459c7b87e9de6cbed7de019b48d9337c2e46b87ba81b9f72d889420b3c')

prepare() {
    cd ${_source}-${pkgver}
    sed -i 's|CFLAGS=		-g -Wall -O2 -Wc++-compat #-Wextra|CFLAGS=		-g -Wall -O2 -Wc++-compat -fPIC #-Wextra|g' Makefile
 }

build() {
    cd ${_source}-${pkgver}
    python setup.py build
}

package() {
    cd ${_source}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE.txt"  "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
