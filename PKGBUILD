# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=cq
pkgver=1.0.0

_ccfgversion=1.0.0.A19
_aosutilverion=0.0.0.13 # Needed for CCFG

pkgrel=24
pkgdesc="CQ -- CCFG Command Line Inteface (Cyan Configurations)"
arch=( 'any' )
url=""
license=('GPL')
groups=()
depends=( 'java-environment' )
makedepends=( 'gradle>=7.0' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://aerialworks.ddns.net/ASF/Cyan.git" "https://aerialworks.ddns.net/maven/org/asf/aos/util/service/aosutil-service-SLIB-UTIL/$_aosutilverion/aosutil-service-SLIB-UTIL-$_aosutilverion.jar")
noextract=()
md5sums=('SKIP'
         'c725e9bee57d6a63ce27b829cfa1a03e')

build() {
    cd Cyan
    cd CCFG
    echo "rootProject.name = 'CCFG';" > settings.gradle
    gradle jar
}

package() {
    mkdir "$pkgdir/usr/lib/ccfg-cq-libs" -p
    cp aosutil-service-SLIB-UTIL-$_aosutilverion.jar "$pkgdir/usr/lib/ccfg-cq-libs/aosutil-slib-util.jar"
    cd Cyan/build/CCFG/Jars
    cp CCFG-$_ccfgversion.jar "$pkgdir/usr/lib/ccfg-cq-libs/CCFG.jar"
    cd ../../../CCFG/cq-script
    mkdir -p "$pkgdir/usr/bin"
    cp cq "$pkgdir/usr/bin"
    chmod +x "$pkgdir/usr/bin/cq"
}
