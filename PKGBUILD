# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf-git
pkgver=3.4.0+12+gcdb607a8
pkgrel=1
pkgdesc='Web application for debugging Android devices (git)'
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
options=(!strip)
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
  cd stf
  install -d "$pkgdir"/usr/{share/stf,bin,share/licenses/stf}
  cp -a . "$pkgdir"/usr/share/stf
  ln -s /usr/share/stf/bin/stf "$pkgdir"/usr/bin/stf
  cp LICENSE "$pkgdir"/usr/share/licenses/stf
}
