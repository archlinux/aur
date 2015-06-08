# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=php-melody
_pkgname=melody
pkgver=1.0
pkgrel=1
pkgdesc="One-file composer scripts."
url="http://melody.sensiolabs.org/"
license="MIT"
arch=("any")
depends=("php>=5.3.2")
makedepends=("php-box" "php-composer")
source=("${pkgname}::git+https://github.com/sensiolabs/melody.git")

build() {
  cd "${srcdir}/${pkgname}"
  composer install --prefer-dist --no-dev
  sed -i '/git-commit/d' box.json
  php-box build
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "build/${_pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
md5sums=('SKIP')
