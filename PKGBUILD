# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru

pkgname=ocrodjvu
pkgver=0.10.3
pkgrel=1
pkgdesc="ocrodjvu is a wrapper for OCR systems, that allows you to perform OCR on DjVu files."
arch=('i686' 'x86_64')
url='http://jwilk.net/software/ocrodjvu'
license=('GPL2')
depends=('python2' 'python2-lxml' 'python2-djvulibre')
optdepends=('python2-html5lib: HTML parser; required for the ``--html5`` option'
            'python2-pyicu: required for the ``--word-segmentation=uax29`` option'
            'cuneiform: OCR system' 
            'tesseract: OCR system'
            'ocrad: OCR system'
            'gocr: OCR system'
            'ocropy: OCR system')
source=(https://github.com/jwilk/ocrodjvu/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('81387c226de2b0241ecf4e03a7a725b72281eb20f6cb58bf08a19fb70857af63')

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
