# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>
# Contributor: Valentin Huélamo <vhuelamo at gmail dot com>

pkgname=cajarename
_pkgnamealt=caja-rename
pkgver="19.3.20.29"
pkgrel="1"
pkgdesc="Batch renaming extension for Caja"
arch=('any')
url="https://tari.in/www/software/cajarename"
license=('GPL3')
depends=('caja' 'python' 'python-gobject' 'gobject-introspection' 'gtk3')
makedepends=('bzr' 'python-setuptools' 'python-polib')
install=${pkgname}.install
source=("bzr+lp:/${pkgname}/trunk")
md5sums=('SKIP')
provides=("${_pkgnamealt}")
conflicts=("${_pkgnamealt}")

pkgver()
{
    cd trunk
    echo "$(cat ${pkgname}/appdata.py | grep APPVERSION | sed 's| ||g' | sed "s|'||g" | cut -f '2' -d '=').$(bzr revno)"
}

build()
{
    cd trunk
    python setup.py build
}

package()
{
    cd trunk
    python setup.py install --root="${pkgdir}" --optimize=1
}
