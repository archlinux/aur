# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=panoply-nodesktop
pkgver=4.3.2
pkgrel=1
pkgdesc='NetCDF, HDF and GRIB Data Viewer by NASA GISS (no freedesktop.org support)'
arch=('any')
url='http://www.giss.nasa.gov/tools/panoply/'
license=('custom')
groups=('nasa-tools')
depends=('java-environment>=7')
makedepends=()
optdepends=()
provides=()
conflicts=(panoply)
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.giss.nasa.gov/tools/panoply/PanoplyJ-${pkgver}.zip"
        'LICENSES'
        'panoply-script.patch')
noextract=()
sha1sums=('ec4d1b99afdab0e57fb94a6b1b40ace56ef2aede'
          'a83855747414873269e21aaff1a53d13ab5de304'
          '707208d062922b5426303238870e0dd269257697')

prepare() {
    cd ${srcdir}/PanoplyJ
    patch -uN -i ../panoply-script.patch || return 1
}

package() {
    install -Dm644 ${srcdir}/LICENSES ${pkgdir}/usr/share/licenses/${pkgname}/LICENSES
    install -d -m755 ${pkgdir}/usr/share/java/panoply
    install -Dm644 ${srcdir}/PanoplyJ/jars/*.jar ${pkgdir}/usr/share/java/panoply
    install -Dm755 ${srcdir}/PanoplyJ/panoply.sh ${pkgdir}/usr/bin/panoply
}
