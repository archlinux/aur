# Maintainer: Martin Kröner <aur@kroner.dev>

qbittorrent_version=5.1.4
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
sha256sums=('1c8117d597c8d48359e00e9d04c36b5bd7ca8844e658452f8d515de3386c5af9'
            'cad6f76111bfbcfbb7ed46ae2bc46557636905418e9c055c106fdc61bfd0c7a3')
sha512sums=('753ba504404c953ad54121b8bdbcce6bf69349c0c016ec9c587f1779a3c80a4be5832c6ba0c53864a5a71d65f6767e9cf5a2dd580ad807f3c7fa2d45ead90805'
            'e4c5c99fff4f48ab82a8790d2c5f73a80b099f368b541530dcd740f72a0870087d98031947e585296b7d0494fcd67394473929be2b5deca952bdc7d92fb8b091')

package() {
	sed -i 's#@EXPAND_BINDIR@#/usr/bin#' qbittorrent-nox@.service
	install -Dm644 qbittorrent-nox@.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm755 qbittorrent-nox -t "$pkgdir/usr/bin"
}
