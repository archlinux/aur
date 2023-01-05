# Maintainer: Cha14ka <cha14ka@yandex.ru>
pkgname=stick-pointer-to-screen
pkgver=1.0
pkgrel=1
pkgdesc="A simple program for X11 window system that prents the cursor from crossing into another monitor when you do't want it to."
arch=('any')
url="https://github.com/LMauricius/sticky-mouse-trap"
license=('MIT')
depends=('gcc' 'make' 'cmake')
source=("git+https://github.com/LMauricius/sticky-mouse-trap")
md5sums=('SKIP')

prepare() {
    cd sticky-mouse-trap

    mkdir -p $HOME/.local/share/applications

    sed 's/Icon=Stick-pointer-to-screen//' Sticky-Mouse-Trap.desktop
    echo 'Icon=//usr/share/pixmaps/Sticky-Mouse-Trap.svg' >> Sticky-Mouse-Trap.desktop
    cp Sticky-Mouse-Trap.desktop $HOME/.local/share/applications/
}

package() {
    cd sticky-mouse-trap

    mkdir -p $pkgdir/usr/share/pixmaps/
    cp Sticky-Mouse-Trap-small.svg $pkgdir/usr/share/pixmaps/Sticky-Mouse-Trap-small.svg
    cp Sticky-Mouse-Trap.svg $pkgdir/usr/share/pixmaps/Sticky-Mouse-Trap.svg

    cmake .
    make -j`nproc`

    install -Dm0755 sticky-mouse-trap "$pkgdir/usr/bin/stick-pointer-to-screen"
}
