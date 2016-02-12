# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Original contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Original Maintainer: Anders Lund <anders at alweb dot dk>

pkgname=opencpn-git
pkgver=20160211.eab78f4
pkgrel=1
pkgdesc="Open Source Chart Plotting and Marine Navigation"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('wxgtk' 'gpsd' 'portaudio' 'tinyxml' 'hicolor-icon-theme')
makedepends=('cmake' 'clang' 'git')
conflicts=("opencpn")
url="http://opencpn.org"
install=opencpn.install
source=("git://github.com/OpenCPN/OpenCPN.git")
sha1sums=('SKIP')

pkgver() {
	cd "OpenCPN"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "OpenCPN"
  CC=clang CXX=clang++ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "OpenCPN"
  make DESTDIR="$pkgdir" install
}
