# Maintainer: Stefan Auditor <stefan@auditor.email>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-compatinfo

_pkgname=php-compatinfo
pkgname=${_pkgname}
pkgver=7.1.4
pkgrel=1
pkgdesc="Library that find out the minimum version and the extensions required for a piece of code to run."
arch=('any')
url="http://php5.laurent-laville.org/compatinfo/"
license=('BSD-3-Clause')
depends=('php' 'php-intl' 'php-sqlite')
makedepends=("php-box" "composer")
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/llaville/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('47b46e6d48dba55bcf172a80f722300a52aff03272098f6afccf16e0dcdd80070c78bf2da8be271d036314518b393b8b2f9616997c5922827ddfb59f576d6639')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  php /usr/bin/composer install
  php -d phar.readonly=Off /usr/bin/box compile
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "bin/phpcompatinfo.phar" "${pkgdir}/usr/bin/phpcompatinfo"
}
