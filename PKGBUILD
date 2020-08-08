# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru

pkgname=ocrodjvu
pkgver=0.12
pkgrel=1
pkgdesc="ocrodjvu is a wrapper for OCR systems, that allows you to perform OCR on DjVu files."
arch=('i686' 'x86_64')
url='http://jwilk.net/software/ocrodjvu'
license=('GPL2')
depends=('python2' 'python2-lxml' 'python2-djvulibre' 'python2-subprocess32')
optdepends=('python2-html5lib: HTML parser; required for the ``--html5`` option'
            'python2-pyicu: required for the ``--word-segmentation=uax29`` option'
            'cuneiform: OCR system' 
            'tesseract: OCR system'
            'ocrad: OCR system'
            'gocr: OCR system'
            'ocropy: OCR system')
source=(https://github.com/jwilk/ocrodjvu/releases/download/$pkgver/$pkgname-$pkgver.tar.xz
        "python2.patch")
sha256sums=('cf0a5ee17fbfdb2fd2bb51cf7774af02319dbdf81f9d70f92c4d8a7f32ce8927'
            'c3b761d0efd66061ee8704e67c16fc37467366b1fbd8625686c6fe923e1a3109')

prepare () {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 -i ../python2.patch
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find . \( -name '*.py' -o -name "djvu2hocr" -o -name "hocr2djvused" -o -name "ocrodjvu" \) -not -type d)

}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
