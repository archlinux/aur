# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

pkgname=systemdunitparser-git
pkgver=0.4
pkgver() {
    cd "$srcdir/systemdunitparser"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

pkgrel=1
pkgdesc="SystemdUnitParser is an extension to Python's configparser.RawConfigParser to properly parse systemd unit files"

arch=('any')
url="https://github.com/sgallagher/systemdunitparser.git"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('systemdunitparser')
provides=('systemdunitparser')

source=(
    "git+https://github.com/sgallagher/systemdunitparser.git"
)

b2sums=('SKIP')

build() {
    cd "$srcdir/systemdunitparser"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/systemdunitparser"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

