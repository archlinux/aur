# Mantainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=php-pharcc
_pkgname=pharcc
pkgver=0.2.4
pkgrel=1
pkgdesc="A command-line tool that converts your php project into a .phar file."
url="https://github.com/cbednarski/pharcc"
license="MIT"
arch=("any")
depends=("php")
source=("https://github.com/cbednarski/pharcc/archive/v${pkgver}.tar.gz")
sha512sums=('95a1108fc66a8a8f217624575d2782cc6737111b6f135b631efa704e5ec88da468f5578eb03f3ac12ba2e80e7bcaa7642705aa9d985da8d13649a6915e3eea02')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  composer install --prefer-dist --no-dev
  php ./bin/pharcc build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${_pkgname}.phar" "${pkgdir}/usr/share/webapps/bin/${_pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
}
