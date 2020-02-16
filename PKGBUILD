# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>
_pkgname=vlc-bittorrent
pkgname=vlc-bittorrent-git
pkgver=v2.8.r1.g0d64665
pkgrel=1
pkgdesc="A bittorrent plugin for VLC."
arch=(x86_64)
url="https://github.com/johang/vlc-bittorrent"
license=('GPL')
depends=(vlc libtorrent-rasterbar)
makedepends=(boost)
conflicts=('vlc-bittorrent')
replaces=('vlc-bittorrent')
source=('git+https://github.com/johang/vlc-bittorrent.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "${srcdir}/${_pkgname}"
    autoreconf -i
    ./configure --prefix=/usr \
                --libdir=/usr/lib/vlc/plugins/bittorrent
    make
}

check() {
    cd "${srcdir}/${_pkgname}"
    make check
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
