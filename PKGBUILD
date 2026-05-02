# Maintainer: BNDays27 <brionical at proton.me>
_pkgname=hedgemodmanager
pkgname=$_pkgname-bin
pkgver=8.0.0.beta5
pkgrel=1
pkgdesc="(UNOFFICIAL PACKAGE) A mod manager for Hedgehog Engine games on PC."
arch=(x86_64)
url="https://github.com/hedge-dev/HedgeModManager"
license=('MIT')
groups=()
depends=('dotnet-runtime-8.0')
optdepends=()
provides=('hedgemodmanager')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname.tar.gz::$url/releases/download/8.0.0-beta5/HedgeModManager-linux-x64.tar.gz"
	"$_pkgname.desktop::https://raw.githubusercontent.com/hedge-dev/HedgeModManager/refs/heads/main/flatpak/hedgemodmanager.desktop"
	"$_pkgname.png::https://raw.githubusercontent.com/hedge-dev/HedgeModManager/refs/heads/main/flatpak/hedgemodmanager.png"
	"LICENSE.md::https://raw.githubusercontent.com/hedge-dev/HedgeModManager/refs/heads/main/LICENSE.md")
noextract=()
sha256sums=('cdeb5c7bca2bba5842ae389afbab7ff41fef8eefe0a0f7a08dc84c09452e7241'
	"SKIP"
	"SKIP"
	"SKIP")
validpgpkeys=()

package() {
	install -Dm644 $srcdir/LICENSE.md $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	mkdir -p $pkgdir/opt/HedgeModManager
	mkdir -p $pkgdir/usr/bin
	sed -i "s|/app/bin/HedgeModManager\.UI|/opt/HedgeModManager/HedgeModManager\.UI|" $srcdir/hedgemodmanager.desktop
	install -Dm644 $srcdir/hedgemodmanager.desktop $pkgdir/usr/share/applications/hedgemodmanager.desktop
	install -Dm644 $srcdir/hedgemodmanager.png $pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.hedge_dev.hedgemodmanager.png
	cp -a $srcdir/output/linux-x64/. $pkgdir/opt/HedgeModManager
	echo -e "#!/usr/bin/sh\nexec /opt/HedgeModManager/HedgeModManager.UI \"\$@\"" >> $pkgdir/usr/bin/hedgemodmanager
	chmod +x $pkgdir/usr/bin/hedgemodmanager
}
