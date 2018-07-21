# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf-git
pkgver=3.3.1+12+g32c9949b
pkgrel=1
pkgdesc='Web application for debugging Android devices (Git)'
arch=(i686 x86_64)
url=https://openstf.io
license=(Apache)
depends=(nodejs-lts-carbon
         rethinkdb
         graphicsmagick
         zeromq
         protobuf
         yasm
         pkg-config)
makedepends=(npm)
provides=(stf)
conflicts=(stf)
options=(!emptydirs !strip)
source=(git+http://github.com/openstf/stf)
sha512sums=(SKIP)

pkgver() {
  cd stf
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd stf
  npm install
}

package() {
  install -d $pkgdir/usr/{share/stf,share/licenses/stf,bin}
  cd stf
  cp -a . $pkgdir/usr/share/stf
  ln -s /usr/share/stf/bin/stf $pkgdir/usr/bin/stf
  cp LICENSE $pkgdir/usr/share/licenses/stf
}
