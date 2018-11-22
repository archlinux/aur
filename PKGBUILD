# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jaume <jaume@delclos.com>

pkgname=rgbds-git
pkgver=0.3.7.r34.g5cb6c4a
pkgrel=1
pkgdesc="Rednex GameBoy Development System (development version)"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('MIT')
provides=('rgbds')
conflicts=('rgbds')
makedepends=('git')
depends=('libpng')
source=($pkgname::"git+https://github.com/rednex/rgbds")
md5sums=("SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr mandir=/usr/share/man install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
