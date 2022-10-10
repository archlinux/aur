pkgname=jazz2-git
pkgver=1.0.0+r5.cc8bee3
pkgrel=1
pkgdesc="Jazz² Resurrection - Open-source Jazz Jackrabbit 2 reimplementation"
arch=(x86_64 aarch64)
url=http://deat.tk/jazz2/
license=(GPL3 custom:MIT/Expat)
depends=(libopenmpt openal)
makedepends=(mesa cmake glfw)
install=jazz2.install
source=(
    git+https://github.com/deathkiller/jazz2-native.git
    jazz2.png
    jazz2.desktop)
md5sums=(
    SKIP
    4f9c50d3c78231f459481eab9d654919
    f603149c956a00b03f28fc7215a460b6)
pkgver(){
    cd jazz2-native
    git describe --tags|sed 's/-\(.*\)-g/+r\1./'
}
build(){
    cd jazz2-native
    sh BuildLinuxGcc.sh
}
package(){
    cd jazz2-native
    install ../Jazz2-LinuxGcc-Release/jazz2 -Dt $pkgdir/usr/bin
    mkdir -p "$pkgdir/usr/share/Jazz² Resurrection"
    cp -r Content "$pkgdir/usr/share/Jazz² Resurrection"
    install ../jazz2.png -Dt $pkgdir/usr/share/pixmaps
    install ../jazz2.desktop -Dt $pkgdir/usr/share/applications
}
