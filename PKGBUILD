# Maintainer:  Evaggelos Balaskas <evaggelos [_AT_] balaskas [_DOT]_ gr>
pkgname=tallow
pkgdesc="Block hosts that attempt to bruteforce SSH using the journald API"

pkgver="18"
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
        ${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz
)

sha256sums=(
    '789cd67a6d2a9a2ecc9aadbc8b03f7a6d1b5764b23df19477affd853e3576a44'
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
