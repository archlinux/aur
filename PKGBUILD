# Maintainer: Robert Tari <robert at tari dot in>

pkgname=cajarename
_pkgnamealt=caja-rename
pkgver=18.7.28.25
pkgrel=2
pkgdesc="Batch renaming extension for Caja"
arch=('any')
url="https://tari.in/www/software/cajarename"
license=('GPL3')
depends=('caja' 'python-caja' 'python2-gobject' 'gobject-introspection' 'gtk3')
makedepends=('bzr' 'python2-setuptools' 'python2-polib')
install=${pkgname}.install
source=("bzr+lp:/${pkgname}/trunk")
md5sums=('SKIP')
provides=("${_pkgnamealt}")
conflicts=("${_pkgnamealt}")

pkgver()
{
    cd $srcdir/trunk
    echo "$(cat ${pkgname}/appdata.py | grep APPVERSION | sed 's| ||g' | sed "s|'||g" | cut -f '2' -d '=').$(bzr revno)"
}

build()
{
    cd ${srcdir}/trunk
    python2 setup.py build
}

package()
{
    cd ${srcdir}/trunk
	python2 setup.py install --root="${pkgdir}" --optimize=1

}
