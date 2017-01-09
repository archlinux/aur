# Maintainer: TGS <techguy100official at gmail dot com>
pkgname=spotify-web-player-for-linux
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A Spotify Web Player wrapper in Electron (64-bit only)"
arch=('x86_64')
url="https://github.com/Quacky2200/Spotify-Web-Player-for-Linux"
license=('MIT')
groups=()
depends=('libappindicator-gtk3' 'libnotify' 'unzip')
makedepends=()
checkdepends=()
optdepends=('dbus: Notification and MPRIS controller support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=README.md
# download source code & node modules for later extraction
source=("https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/archive/$pkgver.tar.gz" "https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/releases/download/$pkgver/node_modules_x64.zip")
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=()

package() {
    echo "[Begin to install Spotify Web Player for Linux, version: $pkgver]"
    echo "PKGBUILD/Arch Linux port by TGS, licensed under the MIT license"
    echo "Original Source: https://github.com/Quacky2200/Spotify-Web-Player-for-Linux"
    echo "PKGBUILD Repository: https://notabug.org/TGS/Spotify-Web-Player-for-Linux-PKGBUILD"
    # 1. Organize and cd to package files
    mv "$pkgver.tar.gz" "$pkgver-$pkgrel.tar.gz"
	cd "$pkgname-$pkgver"
    # 2. Remove old files
    echo "--> Removing old files..."
	sudo rm -rf /usr/bin/spotifywebplayer # remove the old version directory 
	sudo rm -rf /usr/share/pixmaps/spotify.png # remove the old version's spotify icon
	sudo rm -rf /usr/share/applications/spotifywebplayer.desktop # remove the old version's .desktop shortcut
    # fix package directory for later installation (.install file)
	# 3. Extract Node.JS modules/source code & get new package version from source
	# Instructions from https://github.com/Quacky2200/Spotify-Web-Player-for-Linux#manual-install
    # Make directories for Electron and Node.JS libraries
    echo "--> Making directories for Electron/Node.JS libraries..."
    sudo mkdir -p /usr/bin/spotifywebplayer/libs/electron && sudo mkdir /usr/bin/spotifywebplayer/node_modules
    # Download source for version 1.0.0 (the new version to install)
    echo "--> Extracting source code for version $pkgver-$pkgrel..."
    # Extract to spotifywebplayer directory
    cd ..
    sudo tar -zxf $pkgver-$pkgrel.tar.gz --strip 1 -C /usr/bin/spotifywebplayer
    # Download Node.JS modules
    echo "--> Extracting Node.JS modules for version $pkgver-$pkgrel..."
    sudo unzip node_modules_x64.zip -d /usr/bin/spotifywebplayer/node_modules
    echo "--> Downloading prerequisites (Electron, etc.)..."
    sudo sh /usr/bin/spotifywebplayer/get_prerequisites.sh
}
 
