# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="lampswitch-bzr"
_pkgname="lampswitch"
pkgver="20.7.23.42"
pkgrel=1
pkgdesc="Indicator and control applet for Apache"
arch=("any")
url="https://tari.in/www/software/lampswitch"
license=("GPL3")
depends=("gobject-introspection" "gtk3" "python-gobject" "libayatana-appindicator" "desktop-file-utils")
makedepends=("breezy" "python-setuptools" "python-polib")
install="${_pkgname}.install"
source=("bzr+lp:${_pkgname}")
md5sums=("SKIP")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver()
{
    cd ${srcdir}/${_pkgname}
    echo "$(cat ${_pkgname/\-/}/appdata.py | grep APPVERSION | sed 's| ||g' | sed "s|'||g" | cut -f '2' -d '=').$(bzr revno)"
}

build()
{
    cd ${srcdir}/${_pkgname}
    python setup.py build
}

package()
{
    cd ${srcdir}/${_pkgname}
    python setup.py install --root="${pkgdir}" --optimize=1

}
