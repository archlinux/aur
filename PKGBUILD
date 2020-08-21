# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
_yabridgectl=yabridgectl
pkgver=1.5.0
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
sha256sums=('a450afe819bdd53ecbe308081fb1ffc40b5c3ffa65555b40b9f3e848dbb9f6a1'
            'f608c9ba32bccff7b4d394ce9ef957a440b65ac48baa5892e6bdf39cac1c97b5')

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
