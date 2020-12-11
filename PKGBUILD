# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
_yabridgectl=yabridgectl
pkgver=2.2.0
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
sha256sums=('6b9308121e08a2efb1e9077d6477d2b579fc0a0e8ab5f51b5ddd6ab59e7f66f4'
            'a479d7718767a6b40ef956b44af5934f203a95c0c0f922da2b7f86c57fa8cd04')

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
