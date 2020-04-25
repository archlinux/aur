# Maintainer: Jean Jouve <jean.jouve at protonmail dot com>

pkgname=mpd-notification-time-git
pkgver=0.8.5.r25.336d088
pkgrel=1
pkgdesc="Notify about tracks played by mpd. Prints time and notify on received signal."
arch=('x86_64' 'i686')
url="https://github.com/poroing/mpd-notification"
license=('GPL')
depends=('libsystemd' 'ffmpeg' 'file' 'iniparser' 'libnotify' 'libmpdclient')
makedepends=('git' 'systemd' 'markdown')
provides=('mpd-notification')
conflicts=('mpd-notification')
source=('mpd-notification-time::git+https://github.com/Poroing/mpd-notification.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
