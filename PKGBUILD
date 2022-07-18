# Contributor: Andrew M Taylor <a.m.taylor303 at gmail dot com>
# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=shuriken-git
pkgver=0.5.2.r5.gd09afc7
pkgrel=1
pkgdesc="An open source beat slicer"
url="https://rock-hopper.github.io/shuriken"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt5-base' 'liblo' 'aubio' 'rubberband')
makedepends=('jack')
optdepends=('jack: A low-latency audio server')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}"::"git+https://github.com/rock-hopper/${pkgname%-*}.git")
sha256sums=('SKIP')

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

  install -Dm644 packaging/${pkgname%-*}.desktop "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

  install -Dm644 packaging/${pkgname%-*}.png "$pkgdir/usr/share/icons/${pkgname%-*}.png"
}
