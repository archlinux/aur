# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-launchpadlib PKGBUILD by ValHue <vhuelamo at gmail dot com>

_name="launchpadlib"
pkgname=("python-launchpadlib")
pkgver="2.0.0"
pkgrel="1"
pkgdesc="A free Python 3 library for scripting Launchpad through its web services interface."
arch=('any')
url="https://launchpad.net/launchpadlib"
license=('LGPL3')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
depends=('python-lazr-uri' 'python-lazr-restfulclient>=0.14.2'  'python-httplib2' )
optdepends=('python-wadllib' 'python-testresources' 'python-keyring' )
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz.asc")
sha256sums=('5d4a9095e91773a7565d4c159594ae30eca792fd5f9b89ded459d711484a96cb'
            'SKIP')
validpgpkeys=('AC0A4FF12611B6FCCF01C111393587D97D86500B')

prepare() {
    cd "$_name-$pkgver" 
    sed -i "s|find_packages|find_namespace_packages|g" setup.py
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
