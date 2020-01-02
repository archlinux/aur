pkgname=picopt
pkgver=2.0.0
pkgrel=1
pkgdesc="A multi format lossless image optimizer that uses external tools"
url="https://github.com/ajslater/picopt"
depends=('python' 'python-pillow' 'python-argparse' 'python-dateutil' 'python-rarfile')
makedepends=('python-setuptools')
optdepends=(gifsicle mozjpeg optipng jpegrescan jpegtran advpng pngout optipng)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz" setup.py.patch)
sha256sums=('e8f6c007de825e92d57aa9d055c310bc8c7083cf925d015c2d3fe6239490be1c'
            'f79ef4b9f13ca1241f77dd962bed5dd9cc93b69196b8d902c0af9314cfaecd40')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch < "${srcdir}/setup.py.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
