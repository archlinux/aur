# Maintainer: Michael Prager <archlinuxaur@michaelprager.de>
# Contributor: Ammann Max <maximilian.ammann@googlemail.com>
pkgname=srmio
pkgver=0.1.1git1.r6.gb444b87
pkgrel=1
pkgdesc="library + command line tools to access a \"Schoberer Rad Messtechnik\" PowerControl V, VI and 7 + read/write their files"
arch=('i686' 'x86_64')
url="http://www.zuto.de/project/srmio/"
license=('MIT')
makedepends=('gcc' 'make' 'git' 'autoconf')
depends=()
options=('!strip' '!buildflags' 'staticlibs')
source=('git+https://github.com/rclasen/srmio.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  sh ./genautomake.sh
  ./configure --prefix=/usr/
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
