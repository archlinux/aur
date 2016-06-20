# Maintainer: Brian Allred <brian.d.allred@gmail.com>
# This script is licensed under the MIT license.

pkgname=gpmdp
pkgver=3.2.5
pkgrel=1
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music. Stable release."
arch=('i686' 'x86_64')
url="http://www.googleplaymusicdesktopplayer.com"
depends=('libnotify' 'alsa-lib' 'gconf' 'gtk2' 'nss')
optdepends=('gnome-keyring' 'lsb-release' 'libxtst')
provides=('gpmdp')
conflicts=('google-play-music-desktop-player-git' 'gpmdp-git')
license=('MIT')

case $CARCH in
    'x86_64')
        _arch='amd64'
        md5sums=('3a936c33f7a8ce07d95484df59a88e20'
                 '66bc0423e793af7b8ca75b9b175a42c8')
        ;;
    'i686')
        _arch='i386'
        md5sums=('813b20788d2c67fd7fac3ecfbd765112'
                 '66bc0423e793af7b8ca75b9b175a42c8')
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
