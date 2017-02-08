# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

_gitname="phpbrew"
pkgname="${_gitname}-git"
pkgver=1.22.6.18.g42f357d5
pkgrel=1
pkgdesc="Brew & manage PHP versions in pure PHP at HOME"
arch=("any")
url="http://phpbrew.github.io/phpbrew/"
license=("MIT")
depends=("php>=5.3" "curl" "gcc" "binutils" "autoconf" "libxml2" "zlib" "readline")
makedepends=("git" "composer")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/phpbrew/${_gitname}")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

build() {
  cd "${_gitname}"
  composer install
  make
}

package() {
  cd "${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 build/phpbrew "${pkgdir}/usr/bin/phpbrew"
}

# vim:set ts=2 sw=2 et:
