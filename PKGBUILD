# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=subjack-bin
pkgver=3.1.0
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
sha256sums_x86_64=('632bd003cd97deb77f5ce5bd4a8d9fe5e08668eb5a2016ea6c01c45e7f472a2a')
sha256sums_aarch64=('686ae108c5605adac99e71ab3260740eef736a5f48b1a74e3c18907c3b2029e5')

latestver() {
    gh api --paginate repos/haccer/subjack/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/subjack"
}
