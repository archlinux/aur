# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=php-cs-fixer
_pkgname=PHP-CS-Fixer
pkgver=1.8.1
pkgrel=1
pkgdesc="Analyzes some PHP source code and tries to fix coding standards issues (PSR-1 and PSR-2 compatible)."
url="http://cs.sensiolabs.org/"
license="MIT"
arch=("any")
depends=("php>=5.3.6")
makedepends=("php-box" "php-composer")
source=("https://github.com/FriendsOfPHP/${_pkgname}/archive/v${pkgver}.tar.gz")
#source=("${pkgname}::git+https://github.com/FriendsOfPHP/${_pkgname}.git")
sha512sums=('55d5dea180ca5f05c54e34f19f0a6c705b256ca6b836fc12d53d88b34fb4ad2ea9ef0270084867042c2eccc29f1f03025671df5888910c6525e7a3cb76838b2e')

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
