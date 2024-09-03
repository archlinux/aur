# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)
# Contributor: Silvio Ankermann < silvio at booq dot org >

pkgname=photocollage
pkgver=1.4.8
pkgrel=1
pkgdesc='Graphical tool to make photo collage posters.'
url='https://github.com/adrienverge/PhotoCollage'
license=('GPL2')
arch=('any')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-pillow' 'python-gobject' 'python-cairo' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adrienverge/PhotoCollage/archive/v${pkgver}.tar.gz")
sha256sums=('7dae43d9711b7e5e89d8dd75363d967f3d5911b9db65ed3fbe7c95e567215994')


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
