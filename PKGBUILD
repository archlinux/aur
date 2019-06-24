# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf-git
pkgver=3.4.1+r2+g5ff96f54
pkgrel=1
pkgdesc='Web application for controlling and managing Android devices (git)'
arch=(i686 x86_64)
url=https://openstf.io
license=(Apache)
depends=(nodejs
         android-tools
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
source=(git+https://github.com/openstf/stf)
sha512sums=(SKIP)

pkgver() {
  cd stf
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd stf
  npm i
}

package() {
  cd stf
  install -d "$pkgdir"/usr/{share/stf,bin}
  cp -a . "$pkgdir"/usr/share/stf
  ln -s /usr/share/stf/bin/stf "$pkgdir"/usr/bin/stf
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/stf
}
