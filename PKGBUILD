# Maintainer:
_pkgname=kh-melonmix
pkgname=$_pkgname-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A fork of MelonDS, focused on remastering Kingdom Hearts: 358/2 Days and Re:coded"
arch=(x86_64)
url="https://github.com/vitor251093/KHMelonMix"
license=('GPL-3.0-or-later')
options=(!strip)
depends=("libepoxy" "qt5-base" "qt5-multimedia" "qt5-svg" "sdl2" "sdl2-compat" "lua" "fuse2")
install=kh-melonmix.install
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/MelonMix-appimage-$arch.zip"
kh-melonmix.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/icon/melon_256x256.png
kh-melonmix-days.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khDaysMM.png
kh-melonmix-coded.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khCodedMM.png
kh-melonmix.desktop
kh-melonmix-days.desktop
kh-melonmix-recoded.desktop
kh-melonmix
)
sha256sums=("e36f1632d420e234a1888e9cbd7afd3627845207550f98ebbaa155de51f2528c"
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP)

provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
# making all the directories
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/applications
mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps

# move everything (and I mean EVERYTHING) to $pkgdir/opt/Kingdom Hearts Melon Mix
install -Dm755 $srcdir/MelonMix.AppImage "$pkgdir/opt/Kingdom Hearts Melon Mix/MelonMix.AppImage"
install -Dm755 $srcdir/kh-melonmix "$pkgdir/usr/bin"

# installs the .desktop files
install -Dm644 $srcdir/kh-melonmix.desktop "$pkgdir/usr/share/applications"
install -Dm644 $srcdir/kh-melonmix-days.desktop "$pkgdir/usr/share/applications"
install -Dm644 $srcdir/kh-melonmix-recoded.desktop "$pkgdir/usr/share/applications"

# and finally installing the icons I took from the github
cd $srcdir
for file in *.png; do
    if [[ -f "$file" ]]; then
        install -m644 "$file" "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    fi
done

}
