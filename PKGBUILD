# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-cmsscanner

_pkgname=cmsscanner
pkgname="${_pkgname}"
pkgver=0.5.0
pkgrel=2
pkgdesc='Detects FOSS CMS in the local filesystem'
arch=('any')
url='https://github.com/CMS-Garden/cmsscanner'
license=('MIT')
depends=('php')
makedepends=('php-box' 'composer' 'git')
source=("${_pkgname}::git+https://github.com/CMS-Garden/cmsscanner.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  php /usr/bin/composer install --no-dev
  php -d phar.readonly=Off /usr/bin/box compile
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "${_pkgname}.phar" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
