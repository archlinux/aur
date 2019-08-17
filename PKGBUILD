# Maintainer:  Evaggelos Balaskas <evaggelos [_AT_] balaskas [_DOT]_ gr>
pkgname=tallow
pkgdesc="Block hosts that attempt to bruteforce SSH using the journald API"

pkgver="16"
pkgrel=1

arch=('x86_64')
license=('GPL3')

makedepends=(
    'make'
    'gcc'
    'pkg-config'
    'grep'
    'gawk'
)

url="https://github.com/clearlinux/${pkgname}"

source=(
        ${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
)

sha256sums=(
    '290dede05629e52778623f3d6561396bfa82567fcdeb3b2ff5499f962d581264'
)

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr \
      --with-systemdsystemunitdir=/usr/lib/systemd/system
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR=${pkgdir}
}

# vim: sts=2 sw=2 ts=2 et
