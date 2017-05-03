# Maintainer: Adam Hose <adis@blad.is>

pkgbase=opensnitch-git
pkgname=(opensnitch-git)
pkgver=r90.b594e90
pkgrel=1
pkgdesc="OpenSnitch is a GNU/Linux port of the Little Snitch application firewall."
arch=(any)
url=https://github.com/evilsocket/${pkgname%-git}
license=(GPL3)
depends=(python2 python2-pyqt5 python2-netfilterqueue-git python2-dpkt libnetfilter_queue scapy)
makedepends=(git python2-setuptools)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/evilsocket/${pkgname%-git}.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
}
