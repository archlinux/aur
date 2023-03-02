# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=python-mappy
_module=${pkgname#python-}
pkgver=2.24
pkgrel=1
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
            )

options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "https://github.com/lh3/minimap2/blob/1d3c3eef03216fde72f5e1a3850941b0193216d9/LICENSE.txt")
sha256sums=('35a2fb73ef14173283d5abb31e7a318429e0330c3be95851df38dd83d4ff9af9'
            'b37631105ab74fc8fb64aa0a5f0ae9c450b13d50ec1358dc66986551f6fe719b')

prepare() {
    cp LICENSE.txt "$_module-$pkgver"
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
