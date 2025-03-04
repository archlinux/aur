# JSON schema validation and parsing based on libjson-c (by Helmut Jacob)
# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=jsonschema-c-git
pkgver=r16.4abad5a
pkgrel=1
epoch=1
pkgdesc="JSON schema validation and parsing based on libjson-c"
url="https://github.com/helmut-jacob/jsonschema-c"
license=('MIT')
arch=('x86_64')
depends=('glibc' 'json-c')
makedepends=('git' 'make' 'libtool' 'json-c')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname}::git+https://gitlab.com/arkadesOrg/jsonschema-c#branch=port_v2020-12")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  # no tags are reachable from HEAD
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare()
{
  cd "${pkgname%-git}"
  libtoolize
  aclocal
  automake --add-missing
  autoconf
}

build() {
  cd "${pkgname%-git}"
  mkdir -p build; cd build
  ../configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  DESTDIR="$pkgdir" make install
}
