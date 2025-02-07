# Maintainer: Martin Kröner <aur@kroner.dev>

qbittorrent_version=5.0.3
libtorrent_version=2.0.11

pkgname=qbittorrent-nox-static-bin
pkgver="${qbittorrent_version}_v${libtorrent_version}"
pkgrel=2
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
sha256sums=('21272b1a13f63fbc82611a3bbfcc5067e2e1f20530f59aa354cdeb9c4edcfe2a'
	'cad6f76111bfbcfbb7ed46ae2bc46557636905418e9c055c106fdc61bfd0c7a3')
sha512sums=('3214209f1d5e2ffabbae8085dfbdf9e45fb88af415b270bfd820c9c82f6ac9635c6278b75f6d8f83e6255a5a69ed5866bd025b6dcd6f8d0483e292ccfc053405'
	'e4c5c99fff4f48ab82a8790d2c5f73a80b099f368b541530dcd740f72a0870087d98031947e585296b7d0494fcd67394473929be2b5deca952bdc7d92fb8b091')

package() {
	sed -i 's#@EXPAND_BINDIR@#/usr/bin#' qbittorrent-nox@.service
	install -Dm644 qbittorrent-nox@.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm755 qbittorrent-nox -t "$pkgdir/usr/bin"
}
