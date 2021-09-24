# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=btop-git
pkgver=r132.78c417b
pkgrel=1
pkgdesc="A monitor of resources"
arch=(any)
url="https://github.com/aristocratos/btop"
license=('Apache-2.0')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}::git+https://github.com/aristocratos/btop.git")
sha512sums=('SKIP')
provides=('btop')
conflicts=('btop')
options=(!strip)

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  make STATIC=true
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" make install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
