# Maintainer: Ryhon <ryhon@ryhn.link>

pkgname='xp-git'
pkgdesc='GUI and TUI music player with support for multiple streaming services.'
url='https://github.com/Ryhon0/xp'
license=('GPL-3.0')

arch=(any)
pkgrel=1
pkgver=v0.0.1_r48.gf8e756c

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=(liblphobos dbus sdl2_mixer gtk4 libadwaita youtube-dl ffmpeg taglib dbus sqlite3 modest)
makedepends=(dub ldc)
optdepends=('yt-dlp: SponsorBlock for YouTube',
			'yt-dlp-drop-in: faster YouTube download speeds')

source=(git+"${url}".git)
sha256sums=('SKIP')

pkgver ()
{
	cat xp/source/VERSION
	echo -n _
	cd "${pkgname%-git}"
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build ()
{
	cd "${pkgname%-git}"
	dub build -b release --compiler=ldc
	strip "${pkgname%-git}"
}

package()
{
	install -vDm 755 "${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
