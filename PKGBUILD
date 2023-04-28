# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-mappy
_source=minimap2
pkgver=2.25
pkgrel=4
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
sha256sums=('9742ff0be01e51ea7d65f70c01d1344eee6f0d7b135359e0c00aec30fb74ac38')

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
