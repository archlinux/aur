# Maintainer: carstene1ns - https://git.io/ctPKG

pkgname=gtkhash-thunar-git
pkgver=v1.4.r64.g3afea16
pkgrel=1
pkgdesc='A Thunar filemanager plugin for computing message digests or checksums (development version).'
arch=('i686' 'x86_64')
url='https://github.com/tristanheaven/gtkhash'
license=('GPL2')
makedepends=('git')
depends=('gtkhash-git' 'thunar')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=(gtkhash::"git+https://github.com/tristanheaven/gtkhash.git")
md5sums=('SKIP')

pkgver() {
  cd gtkhash

  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd gtkhash

  ./autogen.sh
  ./configure --prefix=/usr --disable-schemas-compile --disable-gtkhash \
              --enable-linux-crypto --enable-nettle --enable-thunar
  make
}

package() {
  make -C gtkhash/src/nautilus DESTDIR="$pkgdir/" install
}
