# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf-git
pkgver=3.4.1+r7+g16e64b51
pkgrel=1
pkgdesc='Web application for controlling and managing Android devices (git)'
arch=(i686 x86_64)
url=https://openstf.io
license=(Apache)
depends=(android-tools 'nodejs<10' rethinkdb zeromq)
makedepends=(git npm python2 graphicsmagick protobuf yasm)
provides=(stf)
conflicts=(stf)
options=(!strip)
source=(git+https://github.com/openstf/stf)
sha512sums=('SKIP')

pkgver() {
  cd stf
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd stf
  npm i
}

package() {
  install -d "$pkgdir"/usr/{lib,bin}
  cp -a stf "$pkgdir"/usr/lib
  ln -s /usr/lib/stf/bin/stf "$pkgdir"/usr/bin

  # We don't need these
  rm -r "$pkgdir"/usr/lib/stf/.{bowerrc,dockerignore,editorconfig,eslintrc,git*,npmignore,travis.yml,tx}

  cd stf
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/stf
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/stf
}
