# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=drawbot-skia
pkgver=0.4.8
pkgrel=2
pkgdesc='A tool for the removal of TrueType instruction sets (hints) in fonts'
arch=(any)
url="https://github.com/justvanrossum/$pkgname"
license=(MIT)
depends=(python
         python-bidi
         'python-fonttools>=4.24.3'
         'python-skia>=87.2'
         'python-skia-pathops>=0.6.0.post2'
         'python-uharfbuzz>=0.16.1'
         python-unicodedata2)
makedepends=(python-setuptools-scm)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('61d4169b10fca6cea40f4d97898c36de0274c918923582ef0eef5767d6f7c161')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
