# Maintainer: Stefan Auditor <stefan@auditor.email>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/jojosch/pkgbuilds

_pkgname=php-box
pkgname=${_pkgname}
pkgver=4.6.8
pkgrel=1
pkgdesc="An application for building and managing Phars"
arch=("any")
url="https://github.com/box-project/box"
license=("MIT")
depends=('php' 'php-sodium')
makedepends=('git' 'composer')
conflicts=('php-box')
provides=('box')
install="${_pkgname}.install"
source=("git+https://github.com/box-project/box.git#tag=${pkgver}")
md5sums=('0a391b0000ae90267bf7daea922aeae7')

prepare() {
  cd "${srcdir}/${provides[0]}"
  composer install --no-interaction
}

build() {
  cd "${srcdir}/${provides[0]}"
  bin/box compile
}

package() {
  cd "${srcdir}/${provides[0]}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 bin/box.phar "${pkgdir}/usr/bin/${provides[0]}"
}
