# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-lazr-uri PKGBUILD by ValHue <vhuelamo at gmail dot com>

_name="lazr.uri"
pkgname=("python-lazr-uri")
pkgver="1.0.6"
pkgrel="2"
pkgdesc="A self-contained, easily reusable library for parsing, manipulating, and generating URIs."
arch=('any')
url="https://launchpad.net/$_name"
license=('LGPL3')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz")
sha256sums=('5026853fcbf6f91d5a6b11ea7860a641fe27b36d4172c731f4aa16b900cf8464')

prepare() {
    cd "$_name-$pkgver"
    sed -i "42d" setup.py 
    sed -i "s|find_packages('src')|['lazr.uri', 'lazr.uri.docs']|g" setup.py 
    sed -i "s|include_package_data=True|include_package_data=False|g" setup.py 
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
