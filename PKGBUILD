# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=saltedauth
pkgver=1.0.0

pkgrel=5
pkgdesc="SaltedAuth -- More secure credential manager for Connective http servers."
arch=( 'any' )
url=""
license=('LGPL3')
groups=( "connective-server" )
depends=( 'java-environment' 'connective-http' )
makedepends=( 'gradle>=6.7' 'cq' )
optdepends=( 'connective-usermanager' )
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=main.install
changelog=
source=("git+https://aerialworks.ddns.net/ASF/SaltedAuth.git")
noextract=()
md5sums=('SKIP')

build() {
    cd SaltedAuth
    chmod +x gradlew createlocalserver.sh
    ./createlocalserver.sh
    gradle build
}

package() {
    cd SaltedAuth
    
    mkdir -p "$pkgdir/usr/lib/salted"
    echo org.asf.connective.auth.SaltedAuthCredTool > "$pkgdir/usr/lib/salted/.credtool.target"
    echo /usr/lib/salted/SaltedAuth.jar >> "$pkgdir/usr/lib/salted/.credtool.target"
    
    mv build/libs/SaltedAuth-*.jar "$pkgdir/usr/lib/salted/SaltedAuth.jar"
}
