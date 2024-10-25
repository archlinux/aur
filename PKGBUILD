# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-wadllib PKGBUILD by ValHue <vhuelamo at gmail dot com>

_name="wadllib"
pkgname=("python-wadllib")
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Python 3 library for navigating WADL files. The Web Application Description Language is an XML vocabulary for describing the capabilities of HTTP resources."
arch=('any')
url="https://launchpad.net/wadllib"
license=('LGPL3')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
depends=('python-lazr-uri' 'python-simplejson')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz")
sha256sums=('1edbaf23e4fa34fea70c9b380baa2a139b1086ae489ebcccc4b3b65fc9737427')

prepare() {
    cd "$_name-$pkgver"
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
