# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Silvio Ankermann < silvio at booq dot org >

pkgname=photocollage
pkgver=1.4.7
pkgrel=1
pkgdesc='Graphical tool to make photo collage posters.'
url='https://github.com/adrienverge/PhotoCollage'
license=('GPL2')
arch=('any')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-pillow' 'python-gobject' 'python-cairo' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adrienverge/PhotoCollage/archive/v${pkgver}.tar.gz")
sha256sums=('9a02db96fa2408a321126ad09638da8da6a5d6a4e61a61e43d83ae7b326d970d')


build() {
    cd "${srcdir}/PhotoCollage-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/PhotoCollage-${pkgver}"

    touch tests/__init__.py  # https://aur.archlinux.org/packages/photocollage#comment-863717
    python -m unittest tests/test_*.py
}


package() {
    cd "${srcdir}/PhotoCollage-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
