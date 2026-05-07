# Maintainer: Martin Kröner <aur@kroner.dev>

qbittorrent_version=5.2.0
libtorrent_version=2.0.12

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
sha256sums=('4bc42999dfc19d8f8741f46390a7237f34cf0b82ef8af00593d901460f9e9936'
            'cad6f76111bfbcfbb7ed46ae2bc46557636905418e9c055c106fdc61bfd0c7a3')
sha512sums=('e36bfb063e749c98a6c05368b6ac95e02fd17e1f05550c81455738cbf1fb721494aacf50e75b6041d37bab031482b27b8579d711c02c28f0d63f845a09e112da'
            'e4c5c99fff4f48ab82a8790d2c5f73a80b099f368b541530dcd740f72a0870087d98031947e585296b7d0494fcd67394473929be2b5deca952bdc7d92fb8b091')

package() {
	sed -i 's#@EXPAND_BINDIR@#/usr/bin#' qbittorrent-nox@.service
	install -Dm644 qbittorrent-nox@.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm755 qbittorrent-nox -t "$pkgdir/usr/bin"
}
