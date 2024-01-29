# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Silvio Ankermann < silvio at booq dot org >

pkgname=photocollage
pkgver=1.4.6
pkgrel=1
pkgdesc='Graphical tool to make photo collage posters.'
url='https://github.com/adrienverge/PhotoCollage'
license=('GPL2')
arch=('any')
makedepends=('python-setuptools')
depends=('python-pillow' 'python-gobject' 'python-cairo' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adrienverge/PhotoCollage/archive/v${pkgver}.tar.gz")
sha256sums=('4a49b97443ebe6a1823d77991d15230882cfa6c78402c923785b0838e80ba1ae')


build() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    python setup.py build
}

check() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    touch tests/__init__.py  # https://aur.archlinux.org/packages/photocollage#comment-863717
    python -m unittest tests/test_*.py
}


package() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
