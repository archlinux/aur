# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-static-bin-nightly
pkgver=20210802
pkgrel=1
pkgdesc="A cross platform connection manager for V2Ray and other backends"
arch=(x86_64)
url="https://github.com/moodyhunter/QvPersonal"
license=('GPL3')
depends=('brotli' 'double-conversion' 'fontconfig' 'glibc' 'libb2' 'libcups' 'libgl' 'libinput'
         'libjpeg-turbo' 'libproxy' 'libxi' 'libxkbcommon-x11' 'libxrender' 'mesa' 'shared-mime-info'
         'tslib' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xdg-utils')
makedepends=('jq')
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
