# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=panoply-nodesktop
pkgver=4.8.7
pkgrel=1
pkgdesc='NetCDF, HDF and GRIB Data Viewer by NASA GISS (no freedesktop.org support)'
arch=('any')
url='http://www.giss.nasa.gov/tools/panoply/'
license=('custom')
groups=('nasa-tools')
depends=('java-runtime>=8')
makedepends=()
optdepends=()
provides=()
conflicts=(panoply)
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.giss.nasa.gov/tools/panoply/download/PanoplyJ-${pkgver}.zip"
        'LICENSES'
        'panoply-script.patch')
noextract=()
sha1sums=('5c6e62c4e368188e51621c787b436e46d7bddb77'
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

