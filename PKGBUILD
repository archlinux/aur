# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=panoply
pkgver=4.2.2
pkgrel=2
pkgdesc='NetCDF, HDF and GRIB Data Viewer by NASA GISS'
arch=('any')
url='http://www.giss.nasa.gov/tools/panoply/'
license=('custom')
groups=('nasa-tools')
depends=('java-runtime>=7')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=panoply.install
changelog=
source=('http://www.giss.nasa.gov/tools/panoply/PanoplyJ.zip'
        'LICENSES'
        'panoply-script.patch'
        'panoply.png'
        'panoply.desktop')
noextract=()
sha1sums=('9db14286bc7e561f063d354aae93ffe9775bb8f9'
          'a83855747414873269e21aaff1a53d13ab5de304'
          '707208d062922b5426303238870e0dd269257697'
          'ef7c4bbe22f18b61a1f215cc43d76e975f0abf17'
          '39c9a58c25d8f764c928e9dfe75f4f73bb9198f0')

prepare() {
    cd ${srcdir}/PanoplyJ
    patch -uN -i ../panoply-script.patch || return 1
}

package() {
    install -Dm644 ${srcdir}/LICENSES ${pkgdir}/usr/share/licenses/${pkgname}/LICENSES
    install -d -m755 ${pkgdir}/usr/share/java/panoply
    install -Dm644 ${srcdir}/PanoplyJ/jars/*.jar ${pkgdir}/usr/share/java/panoply
    install -Dm755 ${srcdir}/PanoplyJ/panoply.sh ${pkgdir}/usr/bin/panoply
    install -d -m755 ${pkgdir}/usr/share/icons/hicolor/48x48/apps
    install -Dm644 ${srcdir}/panoply.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps
    install -d -m755 ${pkgdir}/usr/share/applications
    install -Dm644 ${srcdir}/panoply.desktop ${pkgdir}/usr/share/applications
}
