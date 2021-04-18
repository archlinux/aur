# Maintainer: carstene1ns - https://git.io/ctPKG

pkgname=gtkhash-git
pkgver=v1.4.r64.g3afea16
pkgrel=1
pkgdesc='A cross-platform desktop utility for computing message digests or checksums (development version).'
arch=('i686' 'x86_64')
url='https://github.com/tristanheaven/gtkhash'
license=('GPL2')
makedepends=('git')
depends=('dconf' 'nettle' 'libb2' 'gtk3')
conflicts=('gtkhash')
provides=('gtkhash')
source=(gtkhash::"git+https://github.com/tristanheaven/gtkhash.git")
md5sums=('SKIP')

pkgver() {
  cd gtkhash

  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd gtkhash

  ./autogen.sh
  ./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
              --enable-linux-crypto --enable-nettle
  make
}

package() {
  make -C gtkhash DESTDIR="$pkgdir/" install
}
