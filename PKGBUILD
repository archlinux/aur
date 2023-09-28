# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=shift-cli
pkgver=0.2.8
pkgrel=1
pkgdesc="A tool to run automated tasks for maintaining your Laravel projects."
arch=('any')
url="https://github.com/laravel-shift/cli"
license=('MIT')
depends=('php')
makedepends=("php-box" "git")
_tag_commit=451ca14d15171080d6029caca41103791779d58a
source=("${pkgname}-${pkgver}::git+${url}#commit=$_tag_commit")
b2sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp composer-dev.json composer.json
  composer install --no-dev --prefer-dist --no-progress --no-interaction
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  box compile --no-parallel --no-interaction
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "builds/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
