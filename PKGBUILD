# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='hourglass'
pkgver=2.0.2
pkgrel=1
pkgdesc='Simple clock application that provides stopwatches, alarms, and timers'
arch=('x86_64')
url='https://github.com/sgpthomas/hourglass'
license=('GPL3')
depends=('granite' 'libnotify' 'libhandy')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a4d9dcb95ab3b41b6e4f60d1fa5d83f70d5b533a5e1e579ba63e0830d55c4208')

build () {
    cd "${pkgname}-${pkgver}"
    meson build --prefix=/usr
    cd build
    ninja
}

package () {
    cd "${pkgname}-${pkgver}"
    cd build
    DESTDIR="${pkgdir}" ninja install
    cp "${pkgdir}/usr/bin/com.github.sgpthomas.hourglass" "${pkgdir}/usr/bin/hourglass"
}
