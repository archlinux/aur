# Maintainer: Vladislav Glinsky <cl0ne at mithril dot org dot ua>
# Contributor: Gabriel Moura <develop at srmoura dot com dot br>

pkgname=movim-desktop
pkgver=0.15.90
pkgrel=1
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
    '5f3bfd7d760f7a320015e1b7cd1315bb8a9d00ccf5a749d033c5586dfb378948c8870d233bb3ccfe187f363a1a5a2a959f3ebefa7422dda8d6a9a41db6879f72'
    '0959c41c8260ae134a46d163c2c7f6015c5b26391951f0ac70be677eb74b4492e4e8b68f0fcce61e1d9c2a1e344f1422b81c6390f90f1355fc682f273d7ac495'
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
    chmod +x opt/movim/movim-desktop
    cp -dr --no-preserve=ownership -t "${pkgdir}" {opt,usr}

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/movim/movim-desktop "${pkgdir}/usr/bin/movim-desktop"
}
