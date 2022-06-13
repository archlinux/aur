# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=purple-teams-git
_pkgname=purple-teams
pkgver=r45.7dd4c54
pkgrel=1
pkgdesc="MS Teams Plugin for Pidgin"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/eionrobb/purple-teams"
license=('GPLv3')
depends=('libpurple')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/EionRobb/purple-teams.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  make clean
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
