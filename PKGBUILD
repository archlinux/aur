# Maintainer: Adler Neves <adlerosn@gmail.com>

_pkgname='cicpoffs'
provides=(_pkgname)
conflicts=(_pkgname)
pkgver=0.0.1.r1.efe8871
pkgname="$_pkgname-git"
pkgrel=1
pkgdesc="Case-Insensitive Case-Preserving Overlay FUSE File System"
arch=('any')
depends=('fuse' 'attr')
makedepends=('fuse' 'attr')
url="https://github.com/adlerosn/cicpoffs"
options=()
license=('GPL2')
source=('cicpoffs::git+https://github.com/adlerosn/cicpoffs')
sha512sums=('SKIP')

pkgver() {
  cd cicpoffs
  git show master:cicpoffs.cpp | grep "#define VERSION" | cut -d\" -f2 | tr -d '\n'
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${srcdir}"/$_pkgname
}

package() {
  mkdir -p "${pkgdir}"/usr/bin
  cp "${srcdir}"/$_pkgname/$_pkgname "${pkgdir}"/usr/bin
  ln -s $_pkgname "${pkgdir}"/usr/bin/mount.$_pkgname
}
