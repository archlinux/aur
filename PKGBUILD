pkgname=diablo
_pkgname=Diablo
pkgver=1.0.2
pkgrel=1
pkgdesc="Diablo is an action role-playing video game developed by Blizzard North and released by Blizzard Entertainment Powered by the Devilution engine"
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
url="https://gitlab.com/linuxbombay/diablo"
license=('GPL')
depends=('devilutionx-bin' 'git' 'aria2' 'yad' 'p7zip')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/diablo-$pkgver.tar.bz2")
sha256sums=('f8c8ed0b18b9a00b40ff2fc975c48254183d4d9b8be4cb501f7c44bc069cec69')

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
