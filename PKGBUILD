# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=pplink-bin
pkgver=5.2.1
pkgrel=1
pkgdesc="帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com/"
license=('custom')
makedepends=('tar')
provides=("pplink")
options=('!strip' 'emptydirs')
source=('https://rl1.ppzhilian.com/download/PPZhilian_amd64.deb' 'pplink')
md5sums=('SKIP' 'SKIP')

build() {
    mkdir -p ${srcdir}/build
    tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/build 
}

package() {
    mv "${srcdir}/build/opt/pp直连/" "${srcdir}/build/opt/pplink/"
    sed -i "s/pp直连/pplink/g" "${srcdir}/build/usr/share/applications/pplink.desktop"
    cp -r ${srcdir}/build/opt ${pkgdir}
    cp -r ${srcdir}/build/usr ${pkgdir}
    install -Dm755 pplink "$pkgdir/usr/bin/pplink"
}
