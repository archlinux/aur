# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Joekey joekey1@gmail.com
pkgname=trigger
pkgver=0.6.2 
pkgrel=1
pkgdesc="Free OpenGL rally car racing game"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trigger-rally/"
license=('GPL2')
conflicts=()
depends=('sdl_image' 'physfs' 'freeglut' 'freealut' 'trigger-data' 'glu' xdg-utils)
makedepends=('ftjam' 'glew' 'sdl_mixer')
install=trigger.install
source=(http://sourceforge.net/projects/trigger-rally/files/$pkgname-$pkgver/$pkgname-rally-$pkgver-src.tar.bz2 
        $pkgname.png
        $pkgname.desktop)
sha512sums=('93507131682828735d0de20c8956f83df9a461b30fd5b21c25f4cf81a877c79b7d429d13aa4d2d4d3b3c6a3bdcb1bff51d44188434e04dd36240fd29fe0b13b6'
            '09867405b809e1856d222949dcc81f897eecb87e270cceaca8fd33745ce38bfb52b0a0cb6b12fe90cd844ade92f77b79f803ed8d7c65b59af6f58a89d176f191'
            'c60d02949131eb1e8b42acdf55ebf3b8290d24bebe89bb12e54001be0f78146e1ad0ae8955d480f484134174dd16975deaa37e2f3880b2972e9bdd71763bdacb')

build() {

    cd "$srcdir"/$pkgname-rally-$pkgver-src/ 

    ./autogen.sh
    ./configure --prefix=$pkgdir/usr --datadir=/opt/games/trigger/trigger-$pkgver-data  
    jam -qa || return 1

}

package() {

    install -Dm755 $srcdir/trigger-rally-$pkgver-src/trigger $pkgdir/usr/bin/trigger

    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

# vim:set ts=2 sw=2 et:
