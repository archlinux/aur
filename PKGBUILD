# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=php-cs-fixer
_pkgname=PHP-CS-Fixer
pkgver=1.10
pkgrel=2
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license="MIT"
arch=("any")
depends=("php>=5.3.6")
makedepends=("php-box" "php-composer")
source=("https://github.com/FriendsOfPHP/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('755eb4bc11e791569b1297719181b4e343ef0f37559176c100515e5715b2348d64a487fd8733a8cf8be1ac2aa23270a2ea524117665036de2cf50fe6a51cc677')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  composer install --prefer-dist --no-dev
  sed -i '/git-commit/d' box.json
  php-box build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
