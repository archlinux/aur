# Maintainer: Maksym Sheremet <msheremet at sheremets dot com>

pkgname=upwork-beta
pkgver=5.8.0.35
pkgrel=2
pkgdesc="Upwork Desktop Application, Beta Version"
arch=(x86_64)
url="https://www.upwork.com/ab/downloads/?os=linux"
license=(custom)
conflicts=(upwork)
depends=(alsa-lib gtk3 nss)

_useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0"
_rawver=${pkgver//./_}
_hashver='be1a1520901c4eef'
DLAGENTS=("https::/usr/bin/curl --tlsv1.3 -H ${_useragent// /\\ } %u -o %o")
source=(https://upwork-usw2-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb
        LICENSE)
sha256sums=('4aebf6dd32fa9791e190e4914f9e8ba45459271b922d855cd6e4fa85ef23eced'
            '1554ccf736d822f549db426c7dbb2afe857474d71a9dc25f2ffe19a1a0b30eb8')

prepare() {
    tar xJf data.tar.xz
}

package() {
    # Base
    install -dm755 "$pkgdir/opt/Upwork"
    cp -dr --no-preserve=ownership opt/Upwork/* "$pkgdir/opt/Upwork/"
    # Menu
    install -Dm644 usr/share/applications/upwork.desktop "$pkgdir/usr/share/applications/upwork.desktop"
    # Icons
    install -dm755 "$pkgdir/usr/share"
    cp -dr --no-preserve=ownership usr/share/icons "$pkgdir/usr/share/"
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/upwork/LICENSE"
}
