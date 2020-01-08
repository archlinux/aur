# Maintainer: Brian Allred <brian.d.allred@gmail.com>
# This script is licensed under the MIT license.

pkgname=gpmdp
pkgver=4.7.1
pkgrel=2
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music. Stable release."
arch=('i686' 'x86_64')
url="http://www.googleplaymusicdesktopplayer.com"
depends=('desktop-file-utils' 'hicolor-icon-theme' 'nss' 'libxss' 'gtk3')
optdepends=('apparmor' 'avahi' 'libgnome-keyring')
provides=('gpmdp')
conflicts=('google-play-music-desktop-player-git' 'gpmdp-git')
install=${pkgname}.install
license=('MIT')

case $CARCH in
    'x86_64')
        _arch='amd64'
        md5sums=('28732aaf022f51172add9f80df3d9014'
                 'b776561dd313eb1ded6356247cfffa89')
    ;;
    'i686')
        _arch='i386'
        md5sums=('b1dfcda8ce3e5dc271222dc398445a36'
                 'b776561dd313eb1ded6356247cfffa89')
	;;
esac


source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v${pkgver}/google-play-music-desktop-player_${pkgver}_${_arch}.deb"
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
