# Maintainer: brionical27 <brionical@proton.me>
pkgname=kh-melonmix-bin
pkgver=0.6.8
pkgrel=1
pkgdesc="A fork of MelonDS, focused on remastering Kingdom Hearts: 358/2 Days and Re:coded"
arch=(x86_64)
url="https://github.com/vitor251093/KHMelonMix"
license=('GPL')
depends=("libepoxy" "libslirp" "qt6-base" "qt6-multimedia" "sdl2" "enet" "sdl2-compat" "flac1.3")
install=kh-melonmix.install
source=("melonmix-$pkgver.zip::$url/releases/download/v$pkgver/MelonMix-ubuntu-$arch.zip"
https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/icon/melon_256x256.png
https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khDaysMM.png
https://raw.githubusercontent.com/vitor251093/KHMelonMix/refs/heads/master/res/khCodedMM.png
)
sha256sums=("49739b16343fcec11c68cbba842d28282d17227ec984a740584b01916f2b5026"
SKIP
SKIP
SKIP
)
package() {
# making all the directories
mkdir -p $pkgdir/opt/Kingdom\ Hearts\ Melon\ Mix
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/applications
mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps

# removing the DELETE_ME file that comes with the upstream package because (at least for this) it's really not needed
rm $srcdir/roms/DELETE_ME

# move everything (and I mean EVERYTHING) to $pkgdir/opt/Kingdom Hearts Melon Mix
cd $srcdir
cp -r * $pkgdir/opt/Kingdom\ Hearts\ Melon\ Mix

# removing the symlinked zip file and icon for the game, as well as the shell scripts because i dont use em anyways
cd $pkgdir/opt/Kingdom\ Hearts\ Melon\ Mix/
rm *.png *.zip *.sh

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
	Name=Kingdom Hearts: Re:Coded Melon Mix
	GenericName=KH Melon Mix (DS Emulator)
	Exec=env QT_QPA_PLATFORM=xcb '/opt/Kingdom Hearts Melon Mix/MelonMix' -f '/opt/Kingdom Hearts Melon Mix/roms/recoded.nds'
	Terminal=false
	Path=/opt/Kingdom Hearts Melon Mix
	Type=Application
	Icon=kh-melonmix-coded
	Categories=Game;" >>"$pkgdir/usr/share/applications/kh-melonmix-recoded.desktop"

# and finally installing the icon I took from the github
cp $srcdir/melon_256x256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/kh-melonmix.png
cp $srcdir/khCodedMM.png $pkgdir/usr/share/icons/hicolor/256x256/apps/kh-melonmix-coded.png
cp $srcdir/khDaysMM.png $pkgdir/usr/share/icons/hicolor/256x256/apps/kh-melonmix-days.png
}
