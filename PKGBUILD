# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-static-bin-nightly
pkgver=20210731
pkgrel=1
pkgdesc="A cross platform connection manager for V2Ray and other backends"
arch=(x86_64)
url="https://github.com/moodyhunter/QvPersonal"
license=('GPL3')
depends=('glibc')
optdepends=('v2ray: use packaged v2ray')
provides=('qv2ray')
conflicts=('qv2ray' 'xray')
source=("api-output.json::https://api.github.com/repos/Shadowsocks-NET/QvStaticBuild/releases/latest")
b2sums=('SKIP')

pkgver() {
    cat api-output.json | grep tag_name | cut -d '"' -f 4 | sed 's/^nightly-//;s/-//g'
}

package() {
    curl -Lo $pkgver.tar.zst $(cat api-output.json | grep browser_download_url | cut -d '"' -f 4)
    rm api-output.json
    rm ../api-output.json
    mkdir $pkgdir/usr
    tar -C $pkgdir/usr -xvf $pkgver.tar.zst
}
