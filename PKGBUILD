# Maintainer: Adam Hose <adis@blad.is>

pkgbase=opensnitch-git
pkgname=(opensnitch-git)
pkgver=r106.89ea71f
pkgrel=1
pkgdesc="OpenSnitch is a GNU/Linux port of the Little Snitch application firewall."
arch=(any)
url=https://github.com/evilsocket/${pkgname%-git}
license=(GPL3)
depends=(python python-pyqt5 python-netfilterqueue-git python-dpkt scapy3k python-psutil python-pyinotify)
makedepends=(git python-setuptools)
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
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1
}
