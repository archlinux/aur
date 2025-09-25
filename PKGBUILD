# Maintainer: BNDays27 <brionical@proton.me>
_pkgname=crosspatch
pkgname=$_pkgname-bin
pkgver=1.0.6
pkgrel=1
install=crosspatch.install
pkgdesc="(UNNOFFICIAL PACKAGE) A mod Manager for Sonic Racing: CrossWorlds"
arch=(x86_64)
url="https://github.com/NickPlayzGITHUB/CrossPatch"
license=('GPL')
depends=()
provides=("crosspatch")
source=("$_pkgname-$pkgver::$url/releases/download/$pkgver/CrossPatch_linux.bin"
	"https://raw.githubusercontent.com/NickPlayzGITHUB/CrossPatch/refs/heads/main/CrossP.png")
sha256sums=("96a8603ba51f88695b5ba11761d42f03f2c2e10c882416e04528d0d1b32e6c6c"
	SKIP)

package() {
install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/opt/CrossPatch/$_pkgname"
mkdir -p $pkgdir/usr/bin
echo -e "#!/usr/bin/sh\nexec /opt/CrossPatch/$_pkgname \"\$@\"" >> $pkgdir/usr/bin/$_pkgname
chmod +x $pkgdir/usr/bin/$_pkgname
install -Dm644 "$srcdir/CrossP.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=CrossPatch
Comment=An easy to use mod manager for Sonic Racing: Crossworlds
Exec=$_pkgname
Terminal=false
Categories=Game;
Type=Application
Icon=$_pkgname
END
}
