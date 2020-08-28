# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="caja-rename-bzr"
_pkgname="caja-rename"
pkgver="20.1.25.42"
pkgrel="1"
pkgdesc="Batch renaming extension for Caja"
arch=("any")
url="https://tari.in/www/software/caja-rename/"
license=("GPL3")
depends=("caja" "python-caja" "python" "python-gobject" "gobject-introspection" "gtk3")
makedepends=("breezy" "python-setuptools" "python-polib")
install="${_pkgname}.install"
source=("bzr+lp:${_pkgname/\-/}")
md5sums=("SKIP")
options=("!emptydirs")
provides=("${_pkgname}")
conflicts=("${_pkgname/\-/}")

pkgver()
{
    cd ${srcdir}/${_pkgname/\-/}
    echo "$(cat ${_pkgname/\-/}/appdata.py | grep APPVERSION | sed 's| ||g' | sed "s|'||g" | cut -f '2' -d '=').$(bzr revno)"
}

build()
{
    cd ${srcdir}/${_pkgname/\-/}
    python setup.py build
}

package()
{
    cd ${srcdir}/${_pkgname/\-/}
    python setup.py install --root="${pkgdir}" --optimize=1
}
