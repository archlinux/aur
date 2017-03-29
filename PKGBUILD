# Maintainer: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=acme-git
_pkgname=acme
pkgver=r73.6f42edb
pkgrel=1
pkgdesc="A free crossassembler, that can produce code for the 6502, 6510, 65c02 and 65816 processors"
arch=('i686' 'x86_64')
url="https://github.com/meonwax/acme"
license=('GPL')
source=('git+https://github.com/meonwax/acme.git')
makedepends=('git')
conflicts=('acme')
provides=('acme')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}/src"
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}/src"
  install -D -m755 acme ${pkgdir}/usr/bin/acme
}
