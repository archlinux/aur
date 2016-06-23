# Maintainer: 2ion <dev@2ion.de>
pkgname=bunsen-utilities-git
pkgver=r141.e1caa5d
pkgrel=1
pkgdesc="Collection of utility scripts"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-utilities"
license=('GPL3')
depends=('bunsen-common' 'python' 'python2' 'pygtk' 'python-xlib' 'python-lxml' 'yad')
optdepends=(\
  'upower: Required for bl-exit' \
  'zenity: Required bl-conkyzen and bl-tint2edit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/BunsenLabs/bunsen-utilities.git#branch=master")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "${pkgdir}/usr/bin"
  install -t "${pkgdir}/usr/bin" bin/bl-*
  install -Dm644 bl-exitrc "${pkgdir}/etc/bl-exit/bl-exitrc"
}
