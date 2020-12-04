# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

_pkgname=KindleUnpack
pkgname=kindleunpack
pkgver=0.82
_pkgver=${pkgver/./}
pkgrel=2
pkgdesc="Extract text, images and metadata from Kindle/Mobi files"
arch=('any')
url="http://www.mobileread.com/forums/showthread.php?t=61986"
license=('GPL3')
depends=('python-setuptools' 'tk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kevinhendricks/${_pkgname}/archive/v${_pkgver}.tar.gz"
        "Installing-with-setuptools.diff")
sha256sums=('a012099043581f924820de77971f3bfcf443ad75e4d124fbc805c1cf983a191d'
            'd413733017f7a658a5e3ab6e67d0ca28703632a23c34d0d286ac57bf6376f691')
prepare() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    patch -p1 <../Installing-with-setuptools.diff
}

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
