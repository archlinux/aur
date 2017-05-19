# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>
# Contributor: Moritz Lipp <mlq@pwmt.org>

_pkgname=jumanji
pkgname=${_pkgname}-git
pkgver=r468.6f45380
pkgrel=1
pkgdesc="A highly customizable and functional web browser."
arch=('x86_64' 'i686')
url="https://pwmt.org/projects/jumanji"
license=('custom')
depends=('girara' 'webkitgtk')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://git.pwmt.org/pwmt/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  CFLAGS+=" -O0" make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
