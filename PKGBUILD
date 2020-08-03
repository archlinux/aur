# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="lampswitch"
pkgver="20.7.23.40"
pkgrel=1
pkgdesc="Indicator and control applet for Apache"
arch=("any")
url="https://tari.in/www/software/lampswitch"
license=("GPL3")
depends=("gobject-introspection" "gtk3" "python-gobject" "libayatana-appindicator" "desktop-file-utils")
makedepends=("breezy" "python-setuptools" "python-polib")
optdepends=("mate-ayatana-indicator-applet")
install="${pkgname}.install"
source=("bzr+lp:${pkgname}")
md5sums=("SKIP")

pkgver()
{
    cd ${srcdir}/${pkgname}
    echo "$(cat ${pkgname/\-/}/appdata.py | grep APPVERSION | sed 's| ||g' | sed "s|'||g" | cut -f '2' -d '=').$(bzr revno)"
}

build()
{
    cd ${srcdir}/${pkgname}
    python setup.py build
}

package()
{
    cd ${srcdir}/${pkgname}
    python setup.py install --root="${pkgdir}" --optimize=1

}
