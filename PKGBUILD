# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
_yabridgectl=yabridgectl
pkgver=2.2.1
pkgrel=1
pkgdesc="Yet Another VST bridge, run Windows VST2 plugins under Linux"
epoch=
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'libxcb' 'lib32-libxcb')
makedepends=()
provides=('yabridge' 'yabridgectl')
conflicts=('yabridge' 'yabridgectl' 'yabridgectl-git')
options=('!strip')
install=yabridge.install
source=("https://github.com/robbert-vdh/yabridge/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://github.com/robbert-vdh/yabridge/releases/download/$pkgver/$_yabridgectl-$pkgver.tar.gz")
sha256sums=('e128fa985f643e4a95456fb8d39e0631b3d02b1c6232e73d7237f37ac8508179'
            '6d488bc8d7e2831f8658432c9a5449f6b01d8ae8160d3f7d0763724cd55c147a')

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-{host,group}{,-32}.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge.so "${pkgdir}"/usr/lib

  # Also include yabridgectl
  cd "$srcdir/$_yabridgectl"
  install yabridgectl "${pkgdir}"/usr/bin
}

# vim:set ts=2 sw=2 et:
