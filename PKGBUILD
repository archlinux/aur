# Maintainer : Artem Klevtsov a.a.klevtsov@gmail.com

_pkgname=python3-exiv2
pkgname=python-exiv2
pkgver=0.2.0
pkgrel=2
pkgdesc="py3exiv2 is a Python3 binding to exiv2, the C++ library for manipulation of EXIF, IPTC and XMP image metadata."
url="https://launchpad.net/py3exiv2"
arch=('i686' 'x86_64')
depends=('python>=3.6' 'boost-libs' 'exiv2')
makedepends=('boost')
license=('GPL3')
source=("http://www.py3exiv2.tuxfamily.org/releases/${_pkgname}_${pkgver}.tar.gz")
md5sums=('a1d9ff06e543a68f2fa1b01a9a52e8cf')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p build
    g++ -o build/exiv2wrapper.os -c -fPIC -I/usr/include/python3.6m src/exiv2wrapper.cpp
    g++ -o build/exiv2wrapper_python.os -c -fPIC -I/usr/include/python3.6m src/exiv2wrapper_python.cpp
    g++ -o build/libexiv2python.so -shared build/exiv2wrapper.os build/exiv2wrapper_python.os -lboost_python3 -lexiv2
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2"
    install -D -m755 build/libexiv2python.so "${pkgdir}/usr/lib/python3.6/site-packages/libexiv2python.so"
    install -D -m644 src/pyexiv2/__init__.py "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2/__init__.py"
    install -D -m644 src/pyexiv2/exif.py "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2/exif.py"
    install -D -m644 src/pyexiv2/iptc.py "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2/iptc.py"
    install -D -m644 src/pyexiv2/metadata.py "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2/metadata.py"
    install -D -m644 src/pyexiv2/preview.py "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2/preview.py"
    install -D -m644 src/pyexiv2/utils.py "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2/utils.py"
    install -D -m644 src/pyexiv2/xmp.py "${pkgdir}/usr/lib/python3.6/site-packages/pyexiv2/xmp.py"
}
