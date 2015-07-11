# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru
pkgname=ocrodjvu
pkgver=0.8
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
source=(http://pypi.python.org/packages/source/o/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('e76fc3fbd658a9cbe56f0a015de67d4b3a81b89c4e2c774a44e30776b077dc01')

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
