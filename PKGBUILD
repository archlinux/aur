# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=drawbot-skia
pkgver=0.4.3
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
sha256sums=('21ad8750e1ec136776844a95a628b5f8f221743c4c0f80ac3bc77b1b67adf0a3')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
