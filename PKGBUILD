# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
_yabridgectl=yabridgectl
pkgver=2.0.2
pkgrel=2
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
sha256sums=('573b418284b59a51083a5140c861be289e788725753f0a9f67c18c72f9198921'
            '07067362e77ccf4778fafc4d4636db486930f34cf130a319a4c232d4be3a0ab1')

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
