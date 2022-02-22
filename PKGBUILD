# Maintainer: Exuvo <exuvo@exuvo.se>
pkgname='maminfo-git'
pkgver=r3.g24a6919
pkgrel=1
pkgdesc='Read LTO / Ultrium cartridges medium auxiliary memory attributes'
arch=('i686' 'x86_64')
license=('AGPLv3')
depends=('sg3_utils')
makedepends=('git')
source=("maminfo::git+https://github.com/arogge/maminfo.git" "patch")
sha256sums=('SKIP'
            '663a1678aef13795b3a8b4cbe844a44d275daaaef9564010b98ed64aa1cd199a')

pkgver() {
  cd maminfo
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd maminfo
#  sed -e 's/lto-cm/maminfo/g' -i 'mam-info.c'
  patch --forward --strip=1 --input="$srcdir/patch"
}

build() {
  cd maminfo
  make
}

package() {
  set -u
  cd maminfo
  mkdir -p "$pkgdir/usr/bin/"
  cp mam-info "$pkgdir/usr/bin/"
  set +u
}

# vim:set ts=2 sw=2 et:
