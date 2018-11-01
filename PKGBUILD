# Maintainer: Jaan Toots <jaan@jaantoots.org>
pkgname=python-signpdf
_name=${pkgname#python-}
pkgver=0.0.3
pkgrel=2
pkgdesc="Utility for adding signatures images to PDF documents"
arch=('any')
url="https://pypi.org/project/signpdf"
license=('MIT')
depends=('python-reportlab' 'python-pypdf2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/yourcelf/signpdf/master/LICENSE"
        "python-signpdf.patch")
sha256sums=('50f06007f9bf30ad302f2e76ff01e25bbf4b944a4757555e8eec134599abb590'
            '13b5aa7aaaba5de26c8cb53a3dca05f625f4101c793df6b484f39e6405cc8ac4'
            'c770fa17cab71276d40abce25de2b7b92473233fba35754d1c73d5c1ae1259cb')

prepare() {
    cd "$srcdir/${_name}-${pkgver}"
    patch -p1 -i "$srcdir/${pkgname}.patch"
}

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
