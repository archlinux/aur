# Maintainer: Mia <46620osu gmail com>
# Old maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jaume <jaume@delclos.com>

pkgname=rgbds-git
pkgver=0.9.0.rrc1.25.gcf851463
pkgrel=2
pkgdesc="Rednex GameBoy Development System (development version)"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('MIT')
provides=('rgbds')
conflicts=('rgbds')
makedepends=('git')
depends=('libpng')
source=($pkgname::"git+https://github.com/rednex/rgbds")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
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
