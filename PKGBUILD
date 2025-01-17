# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-pyzm-git
pkgver=0.3.64.r392.043e304
pkgrel=1
pkgdesc='Python API, Log, Event Server and Memory wrapper for ZoneMinder (git version)'
arch=('any')
url='https://github.com/ZoneMinder/pyzm'
license=('GPL-2.0-only')
depends=('python-dateparser' 'python-dotenv' 'python-imutils' 'python-mysql-connector' 'python-numpy' 'python-pillow' 'python-portalocker'
         'python-progressbar' 'python-psutil' 'python-requests' 'python-shapely' 'python-sqlalchemy' 'python-websocket-client')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-pyzm')
conflicts=('python-pyzm')
source=("${pkgname}::git+https://github.com/ZoneMinder/pyzm.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}

    printf "%s.r%s.%s" "$(awk -F \" 'NR==2{print $2}' pyzm/__init__.py)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${pkgname}

    sed -i "s|/etc/zm|/etc/zoneminder|" pyzm/ZMLog.py
}

build() {
    cd ${pkgname}

    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
