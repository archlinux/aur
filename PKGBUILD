# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname="php-go"
pkgver=2.2.1
pkgrel=1
pkgdesc="A simple PHP build tool."
url="https://github.com/herrera-io/php-go"
license="MIT"
arch=("any")
depends=("php>=5.3.3")
makedepends=("php-box" "php-composer" "git")
install="${pkgname}.install"
source=(
  "git+https://github.com/herrera-io/php-go.git#tag=${pkgver}"
)
sha1sums=(
  "SKIP"
)

build() {
  cd "${srcdir}/${pkgname}"

  composer install --prefer-dist --no-dev
  php-box build
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "go-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
