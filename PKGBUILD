# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

_gitname="php-livereload"
pkgname="${_gitname}-git"
pkgver=0.1.2.0.g11759b9
pkgrel=1
pkgdesc="LiveReload server in PHP"
arch=("any")
url="https://github.com/RickySu/php-livereload"
license=("MIT")
depends=("php")
makedepends=("git" "composer" "php-box")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/RickySu/php-livereload")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  git describe --always --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

build() {
  cd "${_gitname}"
  composer install
  php-box build
}

package() {
  cd "${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 dist/reload.phar "${pkgdir}/usr/bin/php-reload"
}

# vim:set ts=2 sw=2 et:
