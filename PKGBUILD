# Maintainer:  Evaggelos Balaskas <evaggelos [_AT_] balaskas [_DOT]_ gr>
pkgname=tallow
pkgdesc="Block hosts that attempt to bruteforce SSH using the journald API"

pkgver="17"
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
    'c3905891a7cb7e7d3be232c8d59be5f58965636d9d97affbfe8f2db6aa5e1c36'
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
