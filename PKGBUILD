# $Id$
# Contributor: Andrew M Taylor <a.m.taylor303 at gmail dot com>
# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=shuriken-git
pkgver=0.5.1.r8.gbfecbac
pkgrel=1
pkgdesc="An open source beat slicer"
url="https://rock-hopper.github.io/shuriken"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt5-base' 'liblo' 'aubio' 'rubberband')
makedepends=('automake' 'libtool' 'pkg-config' 'jack')
optdepends=('jack: A low-latency audio server')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname%-*}"::"git://github.com/rock-hopper/${pkgname%-*}.git"
        "${pkgname%-*}.desktop"
        "${pkgname%-*}.png")
sha256sums=('SKIP'
            'f2144b34c35ecb855009a5d888d13bac2cf5b379274d7b60e4d9181d742fda99'
            'b637b82c35bb4f27eebe779c7790a85758e1b9c64fff8553ede207dda0d9cb37')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-*}"
  ./build
}

package() {
  cd "${srcdir}/${pkgname%-*}"

  make INSTALL_ROOT="$pkgdir/usr" install

  install -Dm644 ../${pkgname%-*}.desktop "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

  install -Dm644 ../${pkgname%-*}.png "$pkgdir/usr/share/icons/${pkgname%-*}.png"
}
