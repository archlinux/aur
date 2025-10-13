# Maintainer: BNDays27 <brionical@proton.me>
_pkgname=crosspatch
pkgname=$_pkgname-bin
pkgver=1.1.1
pkgrel=1
install=crosspatch.install
pkgdesc="(UNNOFFICIAL PACKAGE) A mod Manager for Sonic Racing: CrossWorlds"
arch=(x86_64)
url="https://github.com/NickPlayzGITHUB/CrossPatch"
license=('GPL')
depends=()
provides=("crosspatch")
source=("$_pkgname-$pkgver.zip::https://github.com/NickPlayzGITHUB/CrossPatch/releases/download/$pkgver/CrossPatch${pkgver}_linux.zip"
	"https://raw.githubusercontent.com/NickPlayzGITHUB/CrossPatch/refs/heads/main/assets/CrossP.png")
sha256sums=("641cea8d61c71ac34c6c22461f84d81f86e7f7c6b3c30b680603b38cf47c828d"
	SKIP)

package() {
mkdir -p $pkgdir/opt/CrossPatch
cp -r  * "$pkgdir/opt/CrossPatch/"
rm $pkgdir/opt/CrossPatch/CrossP.png
rm $pkgdir/opt/CrossPatch/${_pkgname}-${pkgver}.zip
mkdir -p $pkgdir/usr/bin
echo -e "#!/usr/bin/sh\nexec /opt/CrossPatch/CrossPatch.bin \"\$@\"" >> $pkgdir/usr/bin/$_pkgname
chmod +x $pkgdir/usr/bin/$_pkgname
install -Dm644 "$srcdir/CrossP.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=CrossPatch
Comment=An easy to use mod manager for Sonic Racing: Crossworlds
Exec=/opt/CrossPatch/CrossPatch.bin %U
Path=/opt/CrossPatch/
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/crosspatch
Type=Application
Icon=$_pkgname
END
}
