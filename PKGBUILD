# C implementation of mustache templating (by José Bollo)
# Maintainer: Dominik Kummer <devel@arkades.org>
pkgname=mustach-git
pkgver=r226.32ba6c6
pkgrel=1
pkgdesc="mustach is a C implementation of the mustache template specification."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/jobol/mustach/"
license=('ISC')
depends=('json-c')
makedepends=('gcc' 'make' 'json-c')
checkdepends=()
optdepends=('jansson' 'cjson')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname}::git+https://gitlab.com/jobol/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  # no tags are reachable from HEAD
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
}
