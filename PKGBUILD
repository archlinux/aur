# Maintainer: ernest <307141632@qq.com>
pkgname=rmeet
pkgdesc="Rmeet" 
pkgver=2.0.0
pkgrel=1
arch=('x86_64')
url="https://rmeet.crc.com.cn/"
license=('LicenseRef-rmeet')
source=("https://rmeetapp.crc.com.cn/downloads/apps/linux/x86/Rmeet-v${pkgver}-${pkgrel}-x86-prod-setup.deb")

md5sums=('25c7e5c4d0db1c880414eec936c88f4f')
options=('!strip' '!debug')
DLAGENTS=('https::/usr/bin/curl -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')
prepare() {
    mv "Rmeet-v${pkgver}-${pkgrel}-x86-prod-setup.deb" "${pkgver}.deb"
    ar -x "${pkgver}.deb"
    mkdir -p "${pkgname}-${pkgver}"

    tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
    cd "$pkgname-$pkgver"
    rm -f opt/Rmeet/libm.so
    rm -f opt/Rmeet/libm.so.6
    rm -f opt/Rmeet/libm-2.31.so
    rm -f opt/Rmeet/libstdc++.so.6
    rm -f opt/Rmeet/libstdc++.so.6.0.28
    cp -r ./ ${pkgdir}/
}
