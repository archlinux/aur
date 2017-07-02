# Maintainer: chuvke <chuvke AT gmail DOT com>
pkgname=digilent-agent
pkgver=6e2057e
_pkgrevision=6e2057e441c650fbd522a6033c2810386363941f
pkgrel=1
epoch=
pkgdesc="enables browser based applications to communicate with Digilent hardware (e.g. the OpenScopeMZ)"
arch=('i686' 'x86_64')
url="https://github.com/Digilent/digilent-agent"
license=('LGPL3')
depends=(qt5-base qt5-serialport)
makedepends=(git)
install="${pkgname}.install"
source=("$pkgname::git+$url.git#commit=$_pkgrevision")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  cd "$pkgname"
  install -Dm 775 "digilent-agent" "${pkgdir}/usr/bin/digilent-agent"
}
