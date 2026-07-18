# Maintainer: Nico Marinò <niconotnicko@gmail.com>

pkgname=cbonsai-focus-git
_gitpkg=cbonsai-focus
pkgver=r144.g6348111
pkgrel=1
pkgdesc='A terminal bonsai focus timer, forked from cbonsai (git version)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4' 'x86_64')
url='https://gitlab.com/ImJstNickDev/cbonsai-focus'
license=('GPL-3.0-only')
depends=('ncurses')
makedepends=('git' 'scdoc')
provides=('cbonsai-focus')
conflicts=('cbonsai-focus')
source=("${_gitpkg}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitpkg}"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 \
      | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.g%s' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "${_gitpkg}"
  make
}

package() {
  cd "${_gitpkg}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
