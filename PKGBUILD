# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Luis Aranguren <pizzaman@hotmail.com>

_pkgname=pyzm
pkgname=python-pyzm-git
pkgver=0.3.56.r332.de527fb
pkgrel=1
pkgdesc="Python API, Log, Event Server and Memory wrapper for ZoneMinder"
arch=('any')
url="https://github.com/ZoneMinder/pyzm"
license=('GPL2')
depends=('python-dateparser' 'python-dotenv' 'python-imutils' 'python-mysql-connector' 'python-numpy' 'python-pillow' 'python-portalocker'
         'python-progressbar' 'python-psutil' 'python-requests' 'python-shapely' 'python-sqlalchemy' 'python-websocket-client')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(git+https://github.com/ZoneMinder/pyzm.git)
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname

    printf "%s.r%s.%s" "$(awk -F \" 'NR==2{print $2}' $_pkgname/__init__.py)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname

    sed -i "s|/etc/zm|/etc/zoneminder|" $_pkgname/ZMLog.py
}

build() {
    cd $_pkgname

    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
