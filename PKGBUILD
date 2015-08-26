# Maintainer: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

_pkgname=tox-weechat
pkgname=tox-weechat-git
pkgver=r260.210a644
pkgrel=1

pkgdesc='Tox protocol plugin for WeeChat'
arch=('i686' 'x86_64')
url='https://github.com/haavardp/tox-weechat'
license=('GPL3')

depends=(
  'toxcore'
  'weechat>=1.0.1'
)
makedepends=('git' 'cmake')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${pkgname}::git+https://github.com/haavardp/tox-weechat.git")
md5sums=('SKIP')

install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
