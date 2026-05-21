# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=subjack-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='Subdomain takeover tool written in Go'
arch=('x86_64' 'aarch64')
url='https://github.com/haccer/subjack'
license=('Apache-2.0')
depends=('glibc')
provides=('subjack')
conflicts=('subjack')
options=('!debug')

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/subjack-linux-amd64")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/subjack-linux-arm64")
sha256sums_x86_64=('679ee958ec7130f74ca375c03baa9cd0d0c41f7d4b919fef7caaded8e0827150')
sha256sums_aarch64=('1a07a687916a3b70adafca9f66a7ec5c8621c389adbcb5b17081a971e1a61aba')

latestver() {
    gh api --paginate repos/haccer/subjack/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/subjack"
}
