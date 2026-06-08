# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=blockcheckw-bin
_pkgbase=${pkgname%-bin}
pkgver=0.8.9
pkgrel=1
pkgdesc="Parallel DPI bypass strategy scanner (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rcd27/$_pkgbase"
license=('MIT')
depends=('zapret2' 'nftables')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!strip' '!debug')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/rcd27/$_pkgbase/v$pkgver/LICENSE")
source_x86_64=("$_pkgbase-$pkgver-x86_64.tar.gz::https://github.com/rcd27/$_pkgbase/releases/download/v$pkgver/$_pkgbase-linux-x86_64.tar.gz")
source_aarch64=("$_pkgbase-$pkgver-aarch64.tar.gz::https://github.com/rcd27/$_pkgbase/releases/download/v$pkgver/$_pkgbase-linux-arm64.tar.gz")
sha256sums=('368255ced66b701e18bb502017f0eab8864c99c68dfa242e77b48ebe1fecb938')
sha256sums_x86_64=('9a670f7ff9919c1bbe76dadd3720371b9316d6d33a4c63de9488b233bb4d5b62')
sha256sums_aarch64=('0b9dc9b65a5e04a56f2babe4b089ca68925b452e2f2d3e7043a85a14451d4f8f')

latestver() {
    gh api --paginate repos/rcd27/$_pkgbase/releases \
        --jq '.[].assets[] | select(.name == "'$_pkgbase'-linux-x86_64.tar.gz") | .browser_download_url' |
    head -1 | grep -oP '/download/v\K[^/]+'
}

package() {
    install -Dm755 $_pkgbase "$pkgdir/usr/bin/$_pkgbase"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
