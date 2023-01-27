# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>

_pkgname=6relayd
pkgname=6relayd-git
pkgver=20230127.70a27fb
pkgrel=1
pkgdesc='Embedded DHCPv6/RA Server & Relay'
url='https://github.com/HikaruDY/6relayd'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git')
depends=()
source=('git+https://github.com/HikaruDY/6relayd.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "${srcdir}/${_pkgname}"
    CFLAGS="${CFLAGS} -Wno-format-security -D_GNU_SOURCE" ./configure --prefix="${pkgdir}/usr" --static
    sed -i "s|XBIN_DIR=.*|XBIN_DIR=bin|g" Project.settings
    make static-app
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install-static-app
}
