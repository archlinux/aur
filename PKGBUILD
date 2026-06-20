# Maintainer: Martin Kröner <aur@kroner.dev>

qbittorrent_version=5.2.2
libtorrent_version=2.0.13

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
sha256sums=('0d219aa16905d75161e5eaee82288358c5d63947ffd48623997fc5dd481664e3'
            'cad6f76111bfbcfbb7ed46ae2bc46557636905418e9c055c106fdc61bfd0c7a3')
sha512sums=('f3f441537cfeadd886d3c8f384a589d161a38f13a071d60ec5e0268b80ff39b4d71d765970ae18cfa05329624abd3aea159b287cc7add20915528d40189ebcdf'
            'e4c5c99fff4f48ab82a8790d2c5f73a80b099f368b541530dcd740f72a0870087d98031947e585296b7d0494fcd67394473929be2b5deca952bdc7d92fb8b091')

package() {
	sed -i 's#@EXPAND_BINDIR@#/usr/bin#' qbittorrent-nox@.service
	install -Dm644 qbittorrent-nox@.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm755 qbittorrent-nox -t "$pkgdir/usr/bin"
}
