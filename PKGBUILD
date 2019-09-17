# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Please report issues at https://github.com/jojosch/pkgbuilds

_pkgname=php-box
pkgname=${_pkgname}
pkgver=3.1.1
pkgrel=1
pkgdesc="An application for building and managing Phars"
arch=("any")
url="https://github.com/humbug/box"
license=("MIT")
depends=("php>=7.2")
makedepends=("make" "php-composer" "git")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  php /usr/bin/composer install --prefer-dist

  ulimit -Sn 2048
  make compile
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "box" "${pkgdir}/usr/bin/box"

  # For backwards compatibility reasons we symlink to the old name.
  ln -s "${pkgdir}/usr/bin/box" "${pkgdir}/usr/bin/${_pkgname}"
}
