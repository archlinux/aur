# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=connective-usermanager
pkgver=1.0.0

pkgrel=8
pkgdesc="UserManager Module -- Authentication backend for Connective servers"
arch=( 'any' )
url=""
license=('LGPL3')
groups=( "connective-server" )
depends=( 'java-environment' 'connective-http' )
makedepends=( 'gradle>=6.7' 'cq' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=main.install
changelog=
source=("git+https://aerialworks.ddns.net/ASF/UserManager.git")
noextract=()
md5sums=('SKIP')

build() {
    cd UserManager
    chmod +x gradlew createlocalserver.sh
    ./createlocalserver.sh
    gradle build
}

package() {
    cd UserManager
    
    mkdir -p "$pkgdir/usr/lib/connective-usermanager"   
    rm build/libs/UserManager-*-sources.jar   
    rm build/libs/UserManager-*-javadoc.jar 
    mv build/libs/UserManager-*.jar "$pkgdir/usr/lib/connective-usermanager/UserManager.jar"
}
