# Maintainer: Ben DeCamp <ben_decamp@outlook.com>
pkgname=retro-graphics-toolkit
pkgver=1.1RC
pkgrel=1
epoch=
pkgdesc="Retro Graphics Editor for Video Game Consoles"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/ComputerNerd/Retro-Graphics-Toolkit"
license=('GPLv3')
groups=()
depends=('fltk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_gitcommit="c5e91e165aeb97a6cb7d6b15189538046cd301f0"
source=(https://github.com/ComputerNerd/Retro-Graphics-Toolkit/archive/$_gitcommit.zip
        https://www.lua.org/ftp/lua-5.3.5.tar.gz
        lua-Makefile.patch
        retro-graphics-toolkit.desktop
        retro-graphics-toolkit.png
)
noextract=()
md5sums=('a71b4960dabbdafb1bd5f7baacc21317'
         '4f4b4f323fd3514a68e0ab3da8ce3455'
         '2cb035965ad4c8b82ffc4235ef98855b'
         '40d2bcd7d7ad3de6f67b29b28935ec57'
         '272d6ba5c03ec6e688bb7312abb88568')

build() {
    patch $srcdir/lua-5.3.5/src/Makefile < lua-Makefile.patch
    cd $srcdir/lua-5.3.5/src
    make linux
    
    mv $srcdir/lua-5.3.5/ $srcdir/Retro-Graphics-Toolkit-$_gitcommit/lua
	cd $srcdir/Retro-Graphics-Toolkit-$_gitcommit
	make
}

package() {
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -d "$pkgdir/usr/bin"
	cd $srcdir/Retro-Graphics-Toolkit-$_gitcommit
	install "RetroGraphicsToolkit" "$pkgdir/usr/bin/RetroGraphicsToolkit"
}
