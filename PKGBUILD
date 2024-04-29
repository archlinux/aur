# Maintainer: SvartaHjarta <qi0cez9jf@mozmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=plastex
pkgver=3.0
pkgrel=3
pkgdesc="Python-based LaTeX document processing framework."
url="https://github.com/$pkgname/$pkgname"
arch=('any')
license=('custom')
depends=('python' 'python-jinja' 'python-unidecode' 'python-pillow' 'python-typing_extensions' 'texlive-core')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
b2sums=('13b266e3dae8b3a30ce5a75bbf34c2e4b0caac9c6b0646d6f1ea35399c85f2aed4943509ca5d02980ddc57dc59df32e5f3fc4ae2a67549be63789f52be096f11')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -D -m644 "$srcdir"/"$pkgname"-"$pkgver"/LICENSE \
        "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    for _i in  "$srcdir/$pkgname-$pkgver"/licenses/*; do
        install -D -m644 ${_i} "$pkgdir"/usr/share/licenses/"$pkgname"/"$_i"
    done
}
