# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

_pkgbase=security-checker
pkgname="php-${_pkgbase}"
pkgver=2.0.2
pkgrel=1
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
sha256sums=(
  "e35e12d9810f0fd0027e5ee5c3b5844fba70498c958a2d3e912f3694eea0a93e"
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
