pkgname=hode-git
pkgver=26bcf11
pkgrel=2
pkgdesc="Heart of Darkness engine rewrite"
arch=(x86_64 aarch64)
url=http://cyxdown.free.fr/hode/
license=(none)
makedepends=(make sdl2 gcc)
optdepends=('heart-of-darkness: provides game data for hode engine')
install=hode.install
source=(
    git+https://github.com/cyxx/hode.git
    hode.ini
    amazing.png
    amazing32.png
    hode.sh
    hode.desktop)
md5sums=(
    SKIP
    874bc298ab565d2d5141101781ef1082
    6d414f0a121fc4bd36f37cb12b8d34d6
    bccc68e0d4e909f147a424dd8fc2e1dd
    dd04ae21e99c973deec654186543da3d
    bfdd04e5fdc88f9dfcc2664bbb7578d6)
pkgver(){
    cd hode
    git rev-parse --short HEAD
}
build(){
    cd hode
    sed -i 's/kFrameDuration)/128)/' paf.cpp    # fix treehouse frame rate
    make
}
package(){
    cd hode
    install hode ../hode.sh -Dt $pkgdir/usr/bin
    install ../hode.ini -Dt $pkgdir/usr/share/hode
    install ../amazing.png -Dt $pkgdir/usr/share/icons/hicolor/512x512/apps
    install ../amazing32.png -D $pkgdir/usr/share/icons/hicolor/32x32/apps/amazing.png
    install ../hode.desktop -Dt $pkgdir/usr/share/applications
    install *.txt *.yaml -Dt $pkgdir/usr/share/doc/hode
}
