# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=connective-http
pkgver=1.0.0

pkgrel=8
pkgdesc="Connective -- Lightweight Java HTTP Server"
arch=( 'any' )
url=""
license=('GPL')
groups=()
depends=( 'java-environment>=15.0' 'authbind' )
makedepends=( 'gradle>=6.7' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=main.install
changelog=
source=("git+https://aerialworks.ddns.net/ASF/ConnectiveStandalone.git" "scripts-and-configs.tar.gz")
noextract=()
md5sums=('SKIP' '74e0fbcc0c5853854c2aa5fc7a4d14c3')

build() {
    cd ConnectiveStandalone
    gradle build
}

package() {
    chmod +x credtool.sh
    chmod +x start.sh
    
    mkdir "$pkgdir/usr/bin" -p
    mkdir "$pkgdir/usr/lib/connective-http" -p
    mkdir "$pkgdir/usr/lib/connective-http/libs" -p
    mkdir "$pkgdir/usr/lib/systemd/system" -p
    mkdir "$pkgdir/etc/connective-http" -p
    mkdir "$pkgdir/etc/connective-http/credentials" -p
    
    cp -rf "$srcdir/ConnectiveStandalone/build/Installations/"*.jar "$pkgdir/usr/lib/connective-http"
    cp -rf "$srcdir/ConnectiveStandalone/build/Installations/libs" "$pkgdir/usr/lib/connective-http"
    
    chmod 660 "$pkgdir/etc/connective-http/credentials"
    
    cp config.props "$pkgdir/etc/connective-http"
    
    cp start.sh "$pkgdir/usr/bin/connective-http"
    cp credtool.sh "$pkgdir/usr/bin/credtool"
    
    cp service.service "$pkgdir/usr/lib/systemd/system/connective-http.service"
}
