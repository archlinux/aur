# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="caja-rename"
pkgver="20.1.25.42"
pkgrel=1
pkgdesc="Batch renaming extension for Caja"
arch=("any")
url="https://tari.in/www/software/caja-rename"
license=("GPL3")
depends=("caja" "python-caja" "python" "python-gobject" "gobject-introspection" "gtk3")
makedepends=("bzr" "python-setuptools" "python-polib")
install="${pkgname}.install"
source=("bzr+lp:/cajarename/trunk")
md5sums=("SKIP")
options=("!emptydirs")

pkgver()
{
    cd trunk
    echo "$(cat cajarename/appdata.py | grep APPVERSION | sed 's| ||g' | sed "s|'||g" | cut -f '2' -d '=').$(bzr revno)"
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
