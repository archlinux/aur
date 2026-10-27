# Maintainer: a821 at mail dot de
# Contributor: Stefan Auditor <stefan@auditor.email>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=php-box
pkgver=4.7.1
pkgrel=1
pkgdesc="An application for building and managing Phars"
arch=("any")
url="https://github.com/box-project/box"
license=("MIT")
depends=('php' 'php-sodium')
makedepends=('git' 'composer')
source=("git+https://github.com/box-project/box.git#tag=${pkgver}")
sha256sums=('d4b6c9cb87298a44468020796f02c6dd5a282a6ad0a8a27aeb13b90b52e7cc8c')

prepare() {
  cd box
  composer install --no-interaction
}

build() {
  cd box
  bin/box compile
}

package() {
  cd box
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 bin/box.phar "${pkgdir}/usr/bin/box"
}
