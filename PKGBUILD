# Maintainer: brionical27 <brionical@proton.me>
pkgname=kh-melonmix-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A fork of MelonDS, focused on remastering Kingdom Hearts: 358/2 Days and Re:coded"
arch=(x86_64)
url="https://github.com/vitor251093/KHMelonMix"
license=('GPL')
depends=("libepoxy" "libslirp" "qt6-base" "qt6-multimedia" "sdl2" "enet" "sdl2-compat" "flac1.3" "lua")
install=kh-melonmix.install
source=("melonmix-$pkgver.zip::$url/releases/download/v$pkgver/MelonMix-ubuntu-$arch.zip"
kh-melonmix.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/icon/melon_256x256.png
kh-melonmix-days.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khDaysMM.png
kh-melonmix-coded.png::https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khCodedMM.png
)
sha256sums=("912582c648c50f7417aa4fd8c6a9bad2e6e3f39142bdcd468ffc324af412a8e4"
SKIP
SKIP
SKIP
)
package() {
# making all the directories
mkdir -p "$pkgdir/opt/Kingdom Hearts Melon Mix/roms"
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/applications
mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
target_dir="$pkgdir/usr/share/icons/hicolor/256x256/apps"

# move everything (and I mean EVERYTHING) to $pkgdir/opt/Kingdom Hearts Melon Mix
install -Dm755 $srcdir/MelonMix "$pkgdir/opt/Kingdom Hearts Melon Mix"

# making all the .desktop files for whatever application launcher you use
echo "[Desktop Entry]
	Name=Kingdom Hearts: Melon Mix
	GenericName=KH Melon Mix (DS Emulator)
	Exec= env QT_QPA_PLATFORM=xcb '/opt/Kingdom Hearts Melon Mix/MelonMix'
	Terminal=false
	Path=/opt/Kingdom Hearts Melon Mix/
	Type=Application
	Icon=kh-melonmix
	Categories=Game;" >>"$pkgdir/usr/share/applications/kh-melonmix.desktop"
echo "[Desktop Entry]
	Name=Kingdom Hearts: 358/2 Days Melon Mix
	GenericName=KH Melon Mix (DS Emulator)
	Exec=env QT_QPA_PLATFORM=xcb  '/opt/Kingdom Hearts Melon Mix/MelonMix' -f '/opt/Kingdom Hearts Melon Mix/roms/days.nds'
	Terminal=false
	Path=/opt/Kingdom Hearts Melon Mix/
	Type=Application
	Icon=kh-melonmix-days
	Categories=Game;" >>"$pkgdir/usr/share/applications/kh-melonmix-days.desktop"
echo "[Desktop Entry]
	Name=Kingdom Hearts: Re:coded Melon Mix
	GenericName=KH Melon Mix (DS Emulator)
	Exec=env QT_QPA_PLATFORM=xcb '/opt/Kingdom Hearts Melon Mix/MelonMix' -f '/opt/Kingdom Hearts Melon Mix/roms/recoded.nds'
	Terminal=false
	Path=/opt/Kingdom Hearts Melon Mix
	Type=Application
	Icon=kh-melonmix-coded
	Categories=Game;" >>"$pkgdir/usr/share/applications/kh-melonmix-recoded.desktop"

# and finally installing the icons I took from the github
cd $srcdir
for file in *.png; do
    if [[ -f "$file" ]]; then
        echo "Installing $file to $target_dir"
        install -m644 "$file" "$target_dir/"
    fi
done

}
