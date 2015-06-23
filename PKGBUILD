# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=residualvm-grim_mouse-git
_gitname=grim_mouse
pkgver=4854.f33e138
pkgrel=1
pkgdesc="A fork of ResidualVM which adds mouse support (point and click) to Grim Fandango"
arch=('i686' 'x86_64')
url="http://forums.residualvm.org/viewtopic.php?p=3049"
license=(GPL)
depends=('sdl' 'zlib' 'alsa-lib' 'glu' 'libmad' 'mesa' 'libmpeg2' 'freetype2')
makedepends=('git')
conflicts=('residualvm' 'residualvm-git')
provides=('residualvm')
source=('git://github.com/tobiaspfaff/grim_mouse#branch=mouse' 'http://demos.residualvm.org/patches/gfupd101.exe')
install=grim_mouse.install
md5sums=('SKIP' 'bc57c4db2ab814f3bb115ec5702b62f4')

pkgver() {
    cd $srcdir/$_gitname
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd $srcdir/$_gitname
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/$_gitname
    make DESTDIR=$pkgdir install
    install -Dm644 $srcdir/$_gitname/dists/residualvm.desktop $pkgdir/usr/share/applications/residualvm.desktop
    install -Dm644 $srcdir/$_gitname/dists/engine-data/mouse.lab $pkgdir/usr/share/residualvm/mouse.lab
    install -Dm644 $srcdir/gfupd101.exe $pkgdir/usr/share/residualvm/gfupd101.exe
}

