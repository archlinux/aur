# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=cq
pkgver=1.0.0.A15

_cyanversion=1.0.0.A11 # Needed to find the right version ZIP
_aosutilverion=0.0.0.13 # Needed for CCFG

pkgrel=2
pkgdesc="CQ -- CCFG Command Line Inteface (Cyan Configurations)"
arch=( 'any' )
url=""
license=('GPL')
groups=()
depends=( 'jdk-openjdk' )
makedepends=( 'gradle>=6.7' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://aerialworks.ddns.net/maven/org/asf/cyan/CyanLoader-Sources/$_cyanversion/CyanLoader-Sources-$_cyanversion-full.zip" "https://aerialworks.ddns.net/maven/org/asf/aos/util/service/aosutil-service-SLIB-UTIL/$_aosutilverion/aosutil-service-SLIB-UTIL-$_aosutilverion.jar")
noextract=()
md5sums=('e8affc3eea165dc31da6d251f775fbf6'
         'c725e9bee57d6a63ce27b829cfa1a03e')

build() {
    cd CCFG
    gradle jar
}

package() {
    mkdir "$pkgdir/usr/lib/ccfg-cq-libs" -p
    cp aosutil-service-SLIB-UTIL-$_aosutilverion.jar "$pkgdir/usr/lib/ccfg-cq-libs/aosutil-slib-util.jar"
    cd build/CCFG/Jars
    cp CCFG-$pkgver.jar "$pkgdir/usr/lib/ccfg-cq-libs/CCFG.jar"
    cd ../../../CCFG/cq-script
    mkdir -p "$pkgdir/usr/bin"
    cp cq "$pkgdir/usr/bin"
}
