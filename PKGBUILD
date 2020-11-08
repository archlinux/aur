# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
_yabridgectl=yabridgectl
pkgver=2.0.0
pkgrel=1
pkgdesc="Yet Another VST bridge, run Windows VST2 plugins under Linux"
epoch=
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'libxcb' 'lib32-libxcb')
makedepends=()
provides=('yabridge' 'yabridgectl')
conflicts=('yabridge' 'yabridgectl-git')
install=yabridge.install
source=("https://github.com/robbert-vdh/yabridge/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://github.com/robbert-vdh/yabridge/releases/download/$pkgver/$_yabridgectl-$pkgver.tar.gz")
sha256sums=('f2038910975ce8d854d938827800ad3bf7cc4f4a8490991d4eaeac09f7e0e8cf'
            'dc52b40326bcc2cdae76679a9101c5c9455a32ae92d5da43ef2cabc588b1406c')

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
