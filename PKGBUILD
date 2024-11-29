pkgname=diablo
_pkgname=Diablo
pkgver=1.0.3.1
pkgrel=2
pkgdesc="Diablo is an action role-playing video game developed by Blizzard North and released by Blizzard Entertainment Powered by the Devilution engine"
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
url="https://gitlab.com/linuxbombay/diablo"
license=('GPL')
depends=('devilutionx-bin' 'git' 'zenity' 'yad')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/diablo-$pkgver.tar.bz2")
sha256sums=('9cfa2b3658a7c641a4698fbef6a3f2f9cbd36a10390aa5b68f189fcd3afa46d3')

package() {
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/pixmaps"  
      cd $srcdir
      for dir in diablo-*/ ; do mv "${dir}" "$_pkgname" ;done
      cd $_pkgname  
      cd "$srcdir/$_pkgname"
      chmod +x $pkgname
      cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
      cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/games/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
