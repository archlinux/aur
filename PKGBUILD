# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

_pkgbase=security-checker
pkgname="php-${_pkgbase}"
pkgver=2.0.0
pkgrel=2
pkgdesc="PHP frontend for security.sensiolabs.org"
url="https://github.com/sensiolabs/security-checker"
license="MIT"
arch=("any")
depends=("php>=5.3.3")
makedepends=("php-box" "php-composer")
install="${pkgname}.install"
source=(
  "https://github.com/sensiolabs/${_pkgbase}/archive/v${pkgver}.zip"
)
sha1sums=(
  "53025de14d8b5c24fa5f971037fa32a5a74e34ea"
)
sha256sums=(
  "472095084181484e4ea49b811dd51e8aac47b3593c48167a99f861e142af02da"
)

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    composer install --prefer-dist
    php-box build
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${_pkgbase}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
