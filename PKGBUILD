# Maintainer: John W. Trengrove <john@retrofilter.com>

pkgname=lpfw-git
_pkgname=lpfw
pkgver=2673860
pkgrel=1
pkgdesc='Leopard Flower personal firewall'
arch=('x86_64' 'i686')
url='https://github.com/themighty1/lpfw'
license=('unknown')
source=('git://github.com/themighty1/lpfw.git' 'lpfw-gui')
depends=('libnetfilter_queue' 'libnetfilter_conntrack' 'libpcap' 'python2' 'python2-pyqt4')
makedepends=('git')
conflicts=('lpfw')
provides=('lpfw')
sha256sums=('SKIP'
            '750af2f138976d7a97606036f56af807d2e7b8e13a7058492ffb8b5bc7f89569')

pkgver() {
  cd "$srcdir/lpfw"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/lpfw"
  make
}

package() {
  cd "$srcdir/lpfw"
  install -Dm755 lpfw "$pkgdir/usr/bin/lpfw"
  mkdir -p "$pkgdir/usr/share/lpfw"
  cp -R "gui" "$pkgdir/usr/share/lpfw/gui"
  cd "$srcdir"
  install -Dm755 lpfw-gui "$pkgdir/usr/bin/lpfw-gui"
}
