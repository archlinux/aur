# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=beat
pkgver=03
pkgrel=1
pkgdesc='Delta patcher for the higan emulator'
arch=('i686' 'x86_64')
url='http://byuu.org/programming/beat/'
license=('GPL3')
depends=('gtk2')
makedepends=('gendesk')
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("http://byuu.net/files/beat_v${pkgver}.tar.xz")
sha256sums=('0f4a33cbbe54af28077433ca9f855e5d80ae942d5d976a0d654a8e1a528a1a1a')

prepare() {
  gendesk -n --pkgname 'beat' --pkgdesc "${pkgdesc}" --name='beat' --exec='beat'
}

build() {
  cd beat

  make \
    platform='x' \
    phoenix='gtk' \
    compiler='g++' \
    flags="$CXXFLAGS -I.. -fomit-frame-pointer -std=gnu++11" \
    link='-s -lX11'
}

package() {
  cd beat

  install -dm 755 "${pkgdir}"/usr/{bin,share/applications}
  install -m 755 beat "${pkgdir}"/usr/bin/beat
  install -m 644 ../beat.desktop "${pkgdir}"/usr/share/applications/beat.desktop
}

# vim: ts=2 sw=2 et:
