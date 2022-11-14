# Maintainer: Maksym Sheremet <msheremet at sheremets dot com>

pkgname=upwork-beta
pkgver=5.8.0.24
pkgrel=1
pkgdesc="Upwork Desktop Application, Beta Version"
arch=(x86_64)
url="https://www.upwork.com/ab/downloads/?os=linux"
license=(custom)
conflicts=(upwork)
depends=(alsa-lib at-spi2-core gtk3 nss)

_useragent="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:106.0) Gecko/20100101 Firefox/106.0"
_rawver=${pkgver//./_}
_hashver='aef0dc8c37cf46a8'
DLAGENTS=("https::/usr/bin/curl --tlsv1.3 -H ${_useragent// /\\ } %u -o %o")
source=(https://upwork-usw2-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb
        LICENSE)
sha256sums=('f57d54fc8988f067c28982e92c3fa320260062c02bd4d24b94e32f79c5caee17'
            '793d8d7bc0f088c48798bda3d5483972636c6b8c5dcd9aeaf85411f7d4547b38')

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
