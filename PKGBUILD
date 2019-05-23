# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

_pkgbase=security-checker
pkgname="php-${_pkgbase}"
pkgver=5.0.3
pkgrel=1
pkgdesc="PHP frontend for security.sensiolabs.org"
url="https://github.com/sensiolabs/security-checker"
license=("MIT")
arch=("any")
depends=("php>=5.3.3")
makedepends=("php-box" "php-composer")
source=(
  "https://github.com/sensiolabs/${_pkgbase}/archive/v${pkgver}.zip"
)
sha256sums=('c36e03bdcc19e375f2d66a44a56649ff61e5b53d2628a3353646d0a983b66b58')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    composer install --prefer-dist
    php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${_pkgbase}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
