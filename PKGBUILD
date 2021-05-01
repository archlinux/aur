# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=ctc
pkgver=1.0.0.A4

_cyanversion=1.0.0.A12 # Needed to find the right version ZIP

pkgrel=1
pkgdesc="CTC -- Cyan Trust Container CLI, frontend for creating CTC trust containers"
arch=( 'any' )
url=""
license=('GPL')
groups=()
depends=( 'java-environment' )
makedepends=( 'gradle>=6.7' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://aerialworks.ddns.net/maven/org/asf/cyan/CyanLoader-Sources/$_cyanversion/CyanLoader-Sources-$_cyanversion-full.zip")
noextract=()
md5sums=( "5bc602d56f6f1f8215094bee3c847c46" )

build() {
    cd CyanComponents
    gradle jar
    cd ../CyanUtil
    gradle jar
    cd ../ClassTrust
    gradle jar
    cd ../TrustExplorer
    gradle jar
}

package() {
    mkdir "$pkgdir/usr/lib/ctc-libs/" -p
    cd build/CyanComponents/Jars
    cp CyanComponents-*.jar "$pkgdir/usr/lib/ctc-libs/CyanComponents.jar"
    
    cd ../../CyanUtil/Jars
    rm -rf ../../CyanComponents/Jars
    cp CyanUtil-*.jar "$pkgdir/usr/lib/ctc-libs/CyanUtil.jar"
    
    cd ../../ClassTrust/Jars
    rm -rf ../../CyanUtil/Jars
    cp ClassTrust-*.jar "$pkgdir/usr/lib/ctc-libs/ClassTrust.jar"
    
    cd ../../TrustExplorer/Jars
    rm -rf ../../ClassTrust/Jars
    cp TrustExplorer-*.jar "$pkgdir/usr/lib/ctc-libs/CTC.jar"
    
    cd ../../
    rm -rf ClassTrust/Jars
    cd ../TrustExplorer
    
    mkdir -p "$pkgdir/usr/bin"
    cp ctc "$pkgdir/usr/bin"
}
