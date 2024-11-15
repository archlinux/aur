# Maintainer: TheDalaiAlpaca dleeg at tutanota dot com
# Issues: https://gitlab.com/TheDalaiAlpaca/sat-yt/-/issues

_pkgname="sat-yt"
pkgname="$_pkgname"
pkgver=0.6.6
pkgrel=1
pkgdesc="YouTube viewer based on saturnon"
arch=('any')
url="https://gitlab.com/TheDalaiAlpaca/sat-yt"
license=('GPL3')
replaces=('sat-yt-git')
makedepends=('git')
depends=('bash' 'coreutils' 'ncurses' 'yt-dlp' 'mpv' 'jq' 'less' 'grep') 
optdepends=()
md5sums=(SKIP)
source=("https://gitlab.com/TheDalaiAlpaca/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")


prepare() {
	if [ ! -f /usr/bin/saturnon ]; then
		cd /tmp
		git clone https://aur.archlinux.org/saturnon.git
		cd /tmp/saturnon
		makepkg -csi
	fi
}


package() {
	cd "$_pkgname-$pkgver"

	install -Dm 644 -t "$pkgdir/etc/saturnon"          "conf/youtube.conf"
	install -Dm 644 -t "$pkgdir/etc/saturnon"          "conf/sat_channelmove.conf"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/play"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/refresh"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/subscribe"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/install_dirs"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/info"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/comments"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/download"

}
