# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="unity-mail"
pkgver="20.7.7.156"
pkgrel="1"
pkgdesc="Mail notifications and count for Unity/MATE/Xfce/LXDE/etc."
arch=("any")
url="https://tari.in/www/software/unitymail"
license=("GPL3")
depends=("ayatana-indicator-messages" "hicolor-icon-theme" "dconf" "gobject-introspection" "desktop-file-utils" "libnotify" "libcanberra" "python-babel" "python-gobject" "python-psutil" "python-secretstorage" "python-urllib3")
makedepends=("breezy" "python-setuptools" "python-polib")
optdepends=("mate-ayatana-indicator-applet" "libunity")
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
