# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru
# Contributor: Ianis Vasilev: ianis@ivasilev.net

pkgname=ocrodjvu-python3-git
pkgver=0.14
pkgrel=2
pkgdesc="OCR for DjVu (Python 3 port)"
arch=('i686' 'x86_64')
url='https://github.com/FriedrichFroebel/ocrodjvu'
license=('GPL-2.0-only')
provides=(ocrodjvu)
conflicts=(ocrodjvu)
makedepends=(python python-build python-installer python-wheel git coreutils make libxslt docbook-xsl)
depends=(python python-lxml python-djvulibre-python)
optdepends=('python-html5lib: HTML parser; required for the ``--html5`` option'
            'python-pyicu: required for the ``--word-segmentation=uax29`` option'
            'cuneiform: OCR system' 
            'tesseract: OCR system'
            'ocrad: OCR system'
            'gocr: OCR system'
            'ocropy: OCR system')
source=(git+https://github.com/FriedrichFroebel/ocrodjvu)
sha512sums=('SKIP')

build() {
    cd "$srcdir/ocrodjvu"
    make -C doc
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/ocrodjvu"
    python -m installer --destdir="$pkgdir" dist/*.whl
    make PREFIX="/usr" DESTDIR="$pkgdir" install_manpage
}
