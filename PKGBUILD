# Maintainer: Brian Allred <brian.d.allred@gmail.com>
# This script is licensed under the MIT license.

pkgname=gpmdp
pkgver=4.7.0
pkgrel=1
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music. Stable release."
arch=('i686' 'x86_64')
url="http://www.googleplaymusicdesktopplayer.com"
depends=('libnotify' 'alsa-lib' 'gconf' 'gtk3' 'nss' 'libxss' 'wget')
optdepends=('gnome-keyring' 'lsb-release' 'libxtst' 'avahi' 'nss-mdns')
provides=('gpmdp')
conflicts=('google-play-music-desktop-player-git' 'gpmdp-git')
install=${pkgname}.install
license=('MIT')

case $CARCH in
    'x86_64')
        _arch='amd64'
		md5sums=('ab8c3e7894596a039e8a5c41fd0af8e9'
         		 'b776561dd313eb1ded6356247cfffa89')
    ;;
    'i686')
        _arch='i386'
		md5sums=('3ba7679d8b76e1dad1d1ce336746c0be'
         		 'b776561dd313eb1ded6356247cfffa89')
	;;
esac


source=("https://3727-40008106-gh.circle-artifacts.com/0/home/circleci/project/dist/installers/debian/google-play-music-desktop-player_4.6.1_$_arch.deb"
		"gpmdp.desktop")

package() {
    # Extract
	tar -xf data.tar.xz -C "${pkgdir}"
    cd "${pkgdir}"
	rm -rf usr/share/lintian
	rm -f usr/share/applications/google-play-music-desktop-player.desktop
	rm -f usr/bin/google-play-music-desktop-player
	chmod -R 755 usr
	
	# Rename
	mv usr/share/doc/google-play-music-desktop-player usr/share/doc/gpmdp
	mv usr/share/google-play-music-desktop-player usr/share/gpmdp
	mv usr/share/pixmaps/google-play-music-desktop-player.png usr/share/pixmaps/gpmdp.png
	ln -s "/usr/share/gpmdp/Google Play Music Desktop Player" "usr/bin/gpmdp"
	cp $srcdir/gpmdp.desktop usr/share/applications/
}
