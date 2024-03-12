# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-mappy
_source=minimap2
pkgver=2.27
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
             'python-build' 
             'python-installer'
            )

options=(!emptydirs)
source=(${_source}-${pkgver}.tar.gz::https://github.com/lh3/minimap2/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('ca9ceb07e3b388858ebc2d7d91a6c74e996659402d16aa759ecedd63588b1ef7')

prepare() {
    cd ${_source}-${pkgver}
    sed -i 's|CFLAGS=		-g -Wall -O2 -Wc++-compat #-Wextra|CFLAGS=		-g -Wall -O2 -Wc++-compat -fPIC #-Wextra|g' Makefile
 }

build() {
    cd ${_source}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_source}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE.txt"  "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
