# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jonathan Toledo <kry0ster@gmail.com>

_pkgname=jumpapp
pkgname="${_pkgname}-git"
pkgver=1.1.r101.4071977
pkgrel=1
pkgdesc="A run-or-raise application switcher for any X11 desktop"
arch=('i686' 'x86_64')
url="https://github.com/mkropat/jumpapp"
license=('MIT')
depends=('xdotool' 'wmctrl')
makedepends=('git')
provides=("${_pkgname}" 'jumpappify-desktop-entry')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/mkropat/jumpapp")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
  local ver=$(grep ^VERSION Makefile | cut -f 2 -d ' ')
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 ${_pkgname} -t ${pkgdir}/usr/bin
  install -Dm755 jumpappify-desktop-entry -t "${pkgdir}/usr/bin"
  install -Dm755 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm755 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
