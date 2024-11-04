# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
pkgver=5.1.1
pkgrel=1
pkgdesc="A modern and transparent way to use Windows VST2, VST3, and CLAP plugins on Linux (includes yabridgectl)"
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
source=("https://github.com/robbert-vdh/yabridge/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('d11f0307412b5566b09a75ed4aa191266db56d22f4de4d20e4fbde6296cd1a47')

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "$pkgdir/usr/bin"
  install yabridge-host{,-32}.exe{,.so} "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/lib"
  install libyabridge{,-chainloader}-{clap,vst2,vst3}.so "$pkgdir/usr/lib"

  install yabridgectl "$pkgdir/usr/bin"
}
