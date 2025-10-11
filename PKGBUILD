# Maintainer: BNDays27 <brionical@proton.me>
_pkgname=crosspatch
pkgname=$_pkgname-bin
pkgver=1.0.8
pkgrel=2
install=crosspatch.install
pkgdesc="(UNNOFFICIAL PACKAGE) A mod Manager for Sonic Racing: CrossWorlds"
arch=(x86_64)
url="https://github.com/NickPlayzGITHUB/CrossPatch"
license=('GPL')
depends=()
provides=("crosspatch")
source=("$_pkgname-$pkgver::$url/releases/download/1.0.8/CrossPatch_Linux.${pkgver}bin"
	"https://raw.githubusercontent.com/NickPlayzGITHUB/CrossPatch/refs/heads/main/assets/CrossP.png")
sha256sums=("610906e951221d76f2c5b80728dd64af63d2dd1f0c92f88e1aac5436f7466b5f"
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
Path=/opt/CrossPatch/
Terminal=false
Categories=Game;
Type=Application
Icon=$_pkgname
END
}
