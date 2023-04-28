# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-mappy
_module=minimap2
pkgver=2.25
pkgrel=2
pkgdesc="Python interface to minimap2, a fast and accurate C program to align genomic and transcribe nucleotide sequences"
arch=('x86_64')
url="https://github.com/lh3/minimap2"
license=('MIT')
depends=(
         'python'
         'minimap2'
        )
makedepends=(
             'python-setuptools'
             'cython'
             'zlib'
             'python-wheel'
            )

options=(!emptydirs)
source=("https://github.com/lh3/minimap2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9742ff0be01e51ea7d65f70c01d1344eee6f0d7b135359e0c00aec30fb74ac38')

prepare() {
    cd "$_module-$pkgver"
    sed -i 's|CFLAGS=		-g -Wall -O2 -Wc++-compat #-Wextra|CFLAGS=		-g -Wall -O2 -Wc++-compat -fPIC #-Wextra|g' Makefile
 }

build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
