# Maintainer: technician <spacedreams@gmx.com>

pkgname=pc6001vx-git
_gitname=PC6001VX
pkgver=v4.0.0.beta.2.r12.gbe17410
pkgrel=1
pkgdesc="Cross platform version of NEC PC-6001 emulator based on PC6001V"
arch=('i686' 'x86_64')
url="https://github.com/eighttails/PC6001VX"
license=('LGPL2.1')
depends=('libx11' 'mesa' 'ffmpeg' 'sdl2' 'qt6-base' 'qt6-tools' 'qt6-multimedia' 'qt6-5compat')
makedepends=('git')
provides=('pc6001vx')
conflicts=('pc6001vx')
source=("$_gitname::git+https://github.com/eighttails/$_gitname.git")
md5sums=('SKIP')
options=(!buildflags)

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_gitname"
    mkdir -p build
}

build() {
    export CFLAGS=" -Wno-error=format-security"

    cd "$srcdir/$_gitname/build"
    qmake6 "$srcdir/$_gitname/$_gitname.pro"
    make
}

package() {
    install -Dm755 "$srcdir/$_gitname/build/$_gitname" "$pkgdir/usr/bin/$_gitname"
    install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}
