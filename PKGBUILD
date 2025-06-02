# Maintainer: Martin Kröner <aur@kroner.dev>

qbittorrent_version=5.1.0
libtorrent_version=2.0.11

pkgname=qbittorrent-nox-static-bin
pkgver="${qbittorrent_version}_v${libtorrent_version}"
pkgrel=1
pkgdesc="An advanced BitTorrent client programmed in C++. Without GUI. Static binary."
url="https://github.com/userdocs/qbittorrent-nox-static"
license=("GPL3")
arch=('x86_64')
options=(!debug)
provides=('qbittorrent-nox')
conflicts=('qbittorrent-nox')
source=(
	"qbittorrent-nox::https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-${pkgver}/x86_64-qbittorrent-nox"
	"qbittorrent-nox@.service::https://raw.githubusercontent.com/qbittorrent/qBittorrent/refs/tags/release-${qbittorrent_version}/dist/unix/systemd/qbittorrent-nox%40.service.in"
)
sha256sums=('5b294474e10ecda07dbf2b67e9b73a7750fb75380b840e35dc0160187fdd7ef9'
	'cad6f76111bfbcfbb7ed46ae2bc46557636905418e9c055c106fdc61bfd0c7a3')
sha512sums=('9abebcd5afd1c9b822b526a4b3a240c44d20511358c9c28f2c113f1aacd38b78cd6e32a5e96808fc9659117dd3b32b0a14f81d76e6d54440f62adda6d59a161f'
	'e4c5c99fff4f48ab82a8790d2c5f73a80b099f368b541530dcd740f72a0870087d98031947e585296b7d0494fcd67394473929be2b5deca952bdc7d92fb8b091')

package() {
	sed -i 's#@EXPAND_BINDIR@#/usr/bin#' qbittorrent-nox@.service
	install -Dm644 qbittorrent-nox@.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm755 qbittorrent-nox -t "$pkgdir/usr/bin"
}
