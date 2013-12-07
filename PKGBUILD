# Contributor: Constantin Schomburg <me@xconstruct.net>
# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=mcpatcher
pkgver='4.3.1'
_jarfile="$pkgname-${pkgver//_/-}.jar"
pkgrel=1
pkgdesc='Minecraft patcher to fix textures with higher than default resolution'
arch=('any')
license=('Public Domain')
url='https://bitbucket.org/prupe/mcpatcher'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$_jarfile")
changelog=ChangeLog
source=("https://bitbucket.org/prupe/mcpatcher/downloads/$_jarfile"
        mcpatcher
        mcpatcher.desktop)
md5sums=('c52b5b8f8ddfc6b5160a4781b16565d4'
         '9ec7aafefe59c2864b70f61d8661113d'
         '5bcaba0e9fbc3a22159c17a64c7688fd')

prepare() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --extract --make-directories 'resources/icon.png' < "$_jarfile"
}

package() {
    cd "$srcdir"

    install -vDm755 'mcpatcher'          "$pkgdir/usr/bin/mcpatcher"
    install -vDm644 'resources/icon.png' "$pkgdir/usr/share/pixmaps/mcpatcher.png"
    install -vDm644 'mcpatcher.desktop'  "$pkgdir/usr/share/applications/mcpatcher.desktop"
    install -vDm644 "$_jarfile"          "$pkgdir/usr/share/java/$pkgname/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:
