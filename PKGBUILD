# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=digitalroadmap
pkgver=1.0.0

pkgrel=1
pkgdesc="DigitalRoadmap - Simple roadmapping utility"
arch=( 'any' )
url=""
license=('GPL')
groups=()
depends=( 'java-environment>=15' )
makedepends=( 'gradle>=6.7' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

prepare() {
    rm -rf DigitalRoadmap
    git clone https://aerialworks.ddns.net/ASF/DigitalRoadmap.git
}

build() {
    cd DigitalRoadmap
    gradle build
    
}

package() {
    cd DigitalRoadmap
    
    mkdir "$pkgdir/usr/lib/" -p
    mkdir "$pkgdir/usr/share/applications/" -p
    
    cd build/libs
    cp DigitalRoadmap-$pkgver-all.jar "$pkgdir/usr/lib/digitalroadmap.jar"
    
    cd ../..
    cp digitalroadmap-exec.desktop digitalroadmap.desktop "$pkgdir/usr/share/applications/"
    
    mkdir -p "$pkgdir/usr/share/mime/packages"
    
    cp asf-digitalroadmap.xml "$pkgdir/usr/share/mime/packages"
    xdg-mime default /usr/share/applications/digitalroadmap-exec.desktop application/x-digitalroadmap
}
