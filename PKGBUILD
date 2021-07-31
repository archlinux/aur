# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=jazzcode
pkgver=1.0.0

pkgrel=9
pkgdesc="Java Advanced website Scripting Service (JazzCode) Module -- Java Web Development for Connective servers"
arch=( 'any' )
url=""
license=('LGPL3')
groups=( "connective-server" )
depends=( 'java-environment' 'connective-http' 'connective-usermanager' )
makedepends=( 'gradle>=6.7' 'cq' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=main.install
changelog=
source=("git+https://aerialworks.ddns.net/ASF/JazzCode.git")
noextract=()
md5sums=('SKIP')

build() {
    cd JazzCode
    chmod +x gradlew createlocalserver.sh
    ./createlocalserver.sh
    gradle build
}

package() {
    cd JazzCode
    
    mkdir -p "$pkgdir/usr/lib/jazzcode" 
    rm build/libs/JazzCode-*-sources.jar   
    rm build/libs/JazzCode-*-javadoc.jar
    mv build/libs/JazzCode-*.jar "$pkgdir/usr/lib/jazzcode/JazzCode.jar"
}
