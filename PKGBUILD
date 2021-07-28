# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=connective-https
pkgver=1.0.0

pkgrel=4
pkgdesc="HTTPS support module for connective servers (requires a keystore.jks file and keystore.jks.password text file in /etc/connective-http)"
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
source=("git+https://aerialworks.ddns.net/ASF/ConnectiveHTTPS.git")
noextract=()
md5sums=('SKIP')

build() {
    cd ConnectiveHTTPS
    chmod +x gradlew createlocalserver.sh
    ./createlocalserver.sh
    gradle build
}

package() {
    cd ConnectiveHTTPS
    
    mkdir -p "$pkgdir/usr/lib/connective-https"    
    mv build/libs/ConnectiveHTTPS-*.jar "$pkgdir/usr/lib/connective-https/ConnectiveHTTPS.jar"
}
