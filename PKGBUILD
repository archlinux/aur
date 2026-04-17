# Maintainer: a821 at mail dot de
# Contributor: Stefan Auditor <stefan@auditor.email>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=php-box
pkgver=4.7.0
pkgrel=1
pkgdesc="An application for building and managing Phars"
arch=("any")
url="https://github.com/box-project/box"
license=("MIT")
depends=('php' 'php-sodium')
makedepends=('git' 'composer')
source=("git+https://github.com/box-project/box.git#tag=${pkgver}")
sha256sums=('3a496bc1434b455c6ee394799ef767dea70225d70c7cd82e0b35f7d70a511807')

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
