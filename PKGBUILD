# Maintainer: Beini <bane [at] iki [dot] fi>
pkgname=csgp-git
pkgver=r16.ab7c867
pkgrel=1
pkgdesc="A port of supergenpass.com in plain C"
arch=('i686' 'x86_64')
url="https://github.com/mgumz/csgp"
license=('MIT')
makedepends=('git')
source=(${pkgname}::git+https://github.com/mgumz/${pkgname%-*})
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build && cd build
  cmake ..
  make -C .
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m755 "build/csgp" "$pkgdir/usr/bin/csgp"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
