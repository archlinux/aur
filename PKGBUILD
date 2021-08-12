# Maintainer: Jan Keith Darunday <jkcdarunday+aur.archlinux.org@gmail.com>

pkgname=binance-bin
_pkgname=binance
pkgver=latest
pkgrel=2
pkgdesc="Buy & sell Crypto in minutes, join the world's largest crypto exchange"
arch=('x86_64')
url="https://www.binance.com/en/download"
license=('MIT')
provides=('binance')
conflicts=('binance')
source=(
    "${_pkgname}-latest.deb::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb"
    "checksum.txt::https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux-deb-sha256.txt"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    tar -zxvf "${srcdir}/control.tar.gz" -C "${srcdir}"  > /dev/null
    egrep '^Version:' control | awk '{print $2}'
}

check() {
    cd "$srcdir"

    DEBFILEHASH=$(sha256sum ${_pkgname}-latest.deb | awk '{print $1}')
    CORRECTHASH=$(cat checksum.txt)

    [[ "$DEBFILEHASH" == "$CORRECTHASH" ]]
}

package() {
    cd "$pkgdir"

    tar -xvf "${srcdir}/data.tar.xz"
    mkdir -p usr/bin
    ln -s /opt/Binance/binance usr/bin/binance
}
