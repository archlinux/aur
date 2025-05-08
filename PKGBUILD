# Maintainer: brionical27 <brionical@proton.me>
pkgname=kh-melonmix-bin
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="A fork of MelonDS, focused on remastering Kingdom Hearts: 358/2 Days and Re:coded"
arch=(x86_64)
url="https://github.com/vitor251093/KHMelonMix"
license=('GPL')
groups=()
depends=("libepoxy" "libslirp" "qt5-base" "qt5-multimedia" "sdl2" "enet" "sdl2-compat")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=kh-melonmix.install
changelog=
source=("$url/releases/download/v$pkgver/MelonMix-ubuntu-$arch.zip"
https://cdn2.steamgriddb.com/icon/da31235cecfce300dec24b9b88e80316.png
	)
noextract=()
sha256sums=(SKIP
SKIP
	)
validpgpkeys=()


 package() {
# making all the directories
mkdir $pkgdir/opt
mkdir $pkgdir/opt/Kingdom\ Hearts\ Melon\ Mix
mkdir $pkgdir/usr
mkdir $pkgdir/usr/share
mkdir $pkgdir/usr/bin
mkdir $pkgdir/usr/share/applications
mkdir $pkgdir/usr/share/icons
mkdir $pkgdir/usr/share/icons/hicolor
mkdir $pkgdir/usr/share/icons/hicolor/256x256
mkdir $pkgdir/usr/share/icons/hicolor/256x256/apps

# move everything (and I mean EVERYTHING) to $pkgdir/opt/Kingdom Hearts Melon Mix
cd $srcdir
cp -r * $pkgdir/opt/Kingdom\ Hearts\ Melon\ Mix

# removing the symlinked zip file and icon for the game, as well as the shell scripts because i dont use em anyways

cd $pkgdir/opt/Kingdom\ Hearts\ Melon\ Mix/
rm *.png *.zip *.sh

# this is for the kh-melonmix-owndir command
 echo "#!/bin/sh

 chown -R $USER /opt/Kingdom\ Hearts\ Melon\ Mix" >>"$pkgdir/usr/bin/kh-melonmix-owndir"

# making all the .desktop files for whatever application launcher you use
echo "[Desktop Entry]
	Name=Kingdom Hearts: Melon Mix
	GenericName=KH Melon Mix (DS Emulator)
	Exec= env QT_QPA_PLATFORM=xcb '/opt/Kingdom Hearts Melon Mix/MelonMix'
	Terminal=false
	Path=/opt/Kingdom Hearts Melon Mix/
	Type=Application
	Icon=kh-melonmix
	Categories=Accessories;" >>"$pkgdir/usr/share/applications/kh-melonmix.desktop"


 chmod +x $pkgdir/usr/bin/kh-melonmix-owndir

echo "[Desktop Entry]
	Name=Kingdom Hearts: 358/2 Days Melon Mix
	GenericName=KH Melon Mix (DS Emulator)
	Exec=env QT_QPA_PLATFORM=xcb  '/opt/Kingdom Hearts Melon Mix/MelonMix' -f '/opt/Kingdom Hearts Melon Mix/roms/days.nds'
	Terminal=false
	Path=/opt/Kingdom Hearts Melon Mix/
	Type=Application
	Icon=kh-melonmix
	Categories=Accessories;" >>"$pkgdir/usr/share/applications/kh-melonmix-days.desktop"

echo "[Desktop Entry]
	Name=Kingdom Hearts: Re:Coded Melon Mix
	GenericName=KH Melon Mix (DS Emulator)
	Exec=env QT_QPA_PLATFORM=xcb '/opt/Kingdom Hearts Melon Mix/MelonMix' -f '/opt/Kingdom Hearts Melon Mix/roms/recoded.nds'
	Terminal=false
	Path=/opt/Kingdom Hearts Melon Mix
	Type=Application
	Icon=kh-melonmix
	Categories=Accessories;" >>"$pkgdir/usr/share/applications/kh-melonmix-recoded.desktop"

# and finally installing the icon I took from SteamGridDB
cp $srcdir/da31235cecfce300dec24b9b88e80316.png $pkgdir/usr/share/icons/hicolor/256x256/apps/kh-melonmix.png
}

