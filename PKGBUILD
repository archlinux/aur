# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ryon Sherman <ryon.sherman@gmail.com>
# Contributor: Dardo Marasca <gefarion@gmail.com>
# Contributor: Kevin Kyzer <kev@k3v.in>
# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet
pkgver=4.6.2
pkgrel=1
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' \
         'lrexlib-pcre5.1' 'qt5-gamepad' 'lua51-utf8'  'ttf-font' 'pugixml' 'lua-yajl')
makedepends=('boost' 'qt5-tools')
optdepends=('discord-rpc-api: discord integration'
            'ttf-bitstream-vera: default font'
            'ttf-ubuntu-font-family: default font')     
conflicts=('mudlet-git')
#source=("http://www.mudlet.org/download/Mudlet-${pkgver}.tar.xz")
##using alternate link
source=("https://www.mudlet.org/wp-content/files/Mudlet-${pkgver}.tar.xz")
sha256sums=('7c0e535db1d1ca931b35bc24b961fe6c1d9bba27168c1f444e1a078ac3575917')


build() {
    cd "$srcdir/src"
    export XDG_DATA_DIRS=/usr/share
    export WITH_FONTS=NO 
    export WITH_UPDATER=NO 
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
