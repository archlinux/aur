# Maintainer: Vladislav Glinsky <cl0ne at mithril dot org dot ua>
# Contributor: Gabriel Moura <develop at srmoura dot com dot br>

pkgname=movim-desktop
pkgver=0.13.90
pkgrel=2
pkgdesc='Movim is a decentralized social network'
arch=('x86_64')
url='https://movim.eu/'
license=('Copyright (c) 2013-2018 GitHub Inc.')
options=('!strip')

source=(
    "https://dosowisko.net/movim/movim-desktop_${pkgver}_amd64.deb"
    "https://dosowisko.net/movim/movim-desktop_${pkgver}_amd64.deb.sig"
    "tray_icon_fix.patch"
)
sha512sums=(
    '84ff5d1a6a15a8b5c536354943b31019042df60322705b69ace63fe908612673e03a6ab022860d04ec25c5d75214b3c6745c41179c35fb265c9ff56d6e8222ab'
    '57e949d08687c5a2b1e316e16ffd6a776c744cc7b3fcad400268da6de4f76b249186070aec5ce79241be934470fd0d84bc9c666c959e56e0d623c3ed961ee043'
    '99c21d8ccc9cd67ae5aa80edf7eae700e163a7df804a824d4d672021bcb10bf188897d0c2fbbf34a8acc292161999915613554f6d731c303e752d45cc950fe30'
)
validpgpkeys=('22DD9FAE006A11435836617CE8F235CF3BDBC3FF')

prepare() {
    tar -zxf data.tar.gz
}

build() {
    patch -p1 < "${srcdir}/tray_icon_fix.patch"
}

package() {
    chmod +x opt/movim/movim
    cp -dr --no-preserve=ownership -t "${pkgdir}" {opt,usr}

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/movim/movim "${pkgdir}/usr/bin/movim-desktop"
}
