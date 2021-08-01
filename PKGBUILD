# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-static-bin-nightly
pkgver=20210801
pkgrel=1
pkgdesc="A cross platform connection manager for V2Ray and other backends"
arch=(x86_64)
url="https://github.com/moodyhunter/QvPersonal"
license=('GPL3')
depends=('glibc' 'libb2')
optdepends=('v2ray: use packaged v2ray')
provides=('qv2ray')
conflicts=('qv2ray' 'xray')
release=$(curl -s https://api.github.com/repos/Shadowsocks-NET/QvStaticBuild/releases/latest)

pkgver() {
    echo $release | jq -r '.tag_name' | sed 's/^nightly-//;s/-//g'
}

package() {
    curl -Lo $pkgver.tar.zst $(echo $release | jq -r '.assets[0].browser_download_url')
    mkdir $pkgdir/usr
    tar -C $pkgdir/usr -xvf $pkgver.tar.zst
}
