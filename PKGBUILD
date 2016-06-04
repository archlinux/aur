# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru

pkgname=ocrodjvu
pkgver=0.9.2
pkgrel=1
pkgdesc="ocrodjvu is a wrapper for OCR systems, that allows you to perform OCR on DjVu files."
arch=('i686' 'x86_64')
url='http://jwilk.net/software/ocrodjvu'
license=('GPL2')
depends=('python2' 'python2-lxml' 'python-djvulibre')
optdepends=('python2-html5lib: HTML parser; required for the ``--html5`` option'
            'python2-pyicu: required for the ``--word-segmentation=uax29`` option'
            'cuneiform: OCR system' 
            'tesseract: OCR system'
            'ocrad: OCR system'
            'gocr: OCR system'
            'ocropy: OCR system')
source=(https://files.pythonhosted.org/packages/source/o/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('caff3adc7929ad612dd9c55cb567a4aeb0f813fa960a3232d1d9717b0fee86f1')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
        -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
        $(find ./ -name '*.py')

    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir
}
