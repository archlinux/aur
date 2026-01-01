# Maintainer: brionical27 <brionical@proton.me>
pkgname=kh-melonmix-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A fork of MelonDS, focused on remastering Kingdom Hearts: 358/2 Days and Re:coded"
arch=(x86_64)
url="https://github.com/vitor251093/KHMelonMix"
license=('GPL')
depends=("libepoxy" "libslirp" "qt6-base" "qt6-multimedia" "qt6-svg" "sdl2" "enet" "sdl2-compat" "flac1.3" "lua")
install=kh-melonmix.install
source=("melonmix-$pkgver.zip::$url/releases/download/v$pkgver/MelonMix-ubuntu-$arch.zip"
kh-melonmix.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/icon/melon_256x256.png
kh-melonmix-days.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khDaysMM.png
kh-melonmix-coded.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khCodedMM.png
kh-melonmix.desktop
kh-melonmix-days.desktop
kh-melonmix-recoded.desktop
)
sha256sums=("1fb8038d84291f3c955b6bf8407a48674faedc1524ce4e6f385408f9b0a4d28c"
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP)

provides=('kh-melonmix')
conflicts=('kh-melonmix')

package() {
# making all the directories
mkdir -p "$pkgdir/opt/Kingdom Hearts Melon Mix/roms"
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/applications
mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
target_dir="$pkgdir/usr/share/icons/hicolor/256x256/apps"

# move everything (and I mean EVERYTHING) to $pkgdir/opt/Kingdom Hearts Melon Mix
install -Dm755 $srcdir/MelonMix "$pkgdir/opt/Kingdom Hearts Melon Mix"

# installs the .desktop files
install -Dm644 $srcdir/kh-melonmix.desktop "$pkgdir/usr/share/applications"
install -Dm644 $srcdir/kh-melonmix-days.desktop "$pkgdir/usr/share/applications"
install -Dm644 $srcdir/kh-melonmix-recoded.desktop "$pkgdir/usr/share/applications"

# and finally installing the icons I took from the github
cd $srcdir
for file in *.png; do
    if [[ -f "$file" ]]; then
        install -m644 "$file" "$target_dir/"
    fi
done

}
