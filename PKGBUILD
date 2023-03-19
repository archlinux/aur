 # Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ryon Sherman <ryon.sherman@gmail.com>
# Contributor: Dardo Marasca <gefarion@gmail.com>
# Contributor: Kevin Kyzer <kev@k3v.in>
# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet
pkgver=4.17.0
pkgrel=1
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' \
         'lrexlib-pcre5.1' 'qt5-gamepad' 'lua51-luautf8'  'ttf-font' 'pugixml' 'lua-yajl' 'qtkeychain-qt5' 'lua51-lcf')
makedepends=('boost' 'qt5-tools')
optdepends=('ttf-bitstream-vera: default font'
            'ttf-ubuntu-font-family: default font'
            'noto-fonts-emoji: emoji font support')     
#source=("http://www.mudlet.org/download/Mudlet-${pkgver}.tar.xz")
##using alternate link
source=("https://www.mudlet.org/wp-content/files/Mudlet-${pkgver}.tar.xz")
sha256sums=('9a95bde8cf8e5fe6839795a515dda79d037fc48077aed6ac346d8be0951084f2')


build() {
    cd "$srcdir/src"
    export WITH_FONTS=NO 
    export WITH_OWN_QTKEYCHAIN=NO
    export WITH_UPDATER=NO
    export WITH_VARIABLE_SPLASH_SCREEN=NO
    export XDG_DATA_DIRS=/usr/share
    
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd $srcdir/src
    make INSTALL_ROOT="$pkgdir" install
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -m 644 ../mudlet.desktop ${pkgdir}/usr/share/applications
    install -m 644 ../mudlet.svg ${pkgdir}/usr/share/pixmaps    
}
