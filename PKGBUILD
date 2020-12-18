# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=drawbot-skia
pkgver=0.4.6
pkgrel=1
pkgdesc='A tool for the removal of TrueType instruction sets (hints) in fonts'
arch=(any)
url="https://github.com/justvanrossum/$pkgname"
license=('MIT')
depends=('python'
         'python-bidi'
         'python-fonttools'
         'python-skia'
         'python-skia-pathops'
         'python-uharfbuzz'
         'python-unicodedata2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3ba497e776b7a232efb0565d4e7c8751cec9e7fbf3c3de39aac2d45cacb089cf')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
