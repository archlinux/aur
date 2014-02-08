# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei-git
pkgver=1.0a.r118.g0212de9
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="http://taisei-project.org/"
license=('MIT')
depends=('sdl_ttf' 'hicolor-icon-theme' 'mesa' 'libpng' 'freealut' 'glu')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'cmake')
install=taisei.install
source=(taisei::"git+https://github.com/laochailan/taisei.git")
md5sums=('SKIP')

pkgver() {
  cd taisei
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd taisei

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd taisei

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
