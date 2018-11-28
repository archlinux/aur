# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Siddhartha Das <https://github.com/babluboy, bablu.boy@gmail.com>

pkgname=nutty-git
pkgver=120.8af2d4a
pkgrel=1
_gitname=nutty
pkgdesc='A network utility for linux. Monitor the devices on your network and check bandwidth and speed details.'
arch=('i686' 'x86_64')
url='https://github.com/babluboy/nutty'
license=('GPL3')
depends=('gtk3' 'granite' 'sqlite' 'libxml2' 'libnotify' 'libgee')
optdepends=()
makedepends=('vala' 'git' 'meson')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('git+https://github.com/babluboy/nutty.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $srcdir/$_gitname
  git submodule init; git submodule update
}

build() {
  mkdir -p $srcdir/$_gitname/build
  cd $srcdir/$_gitname/build
  arch-meson
  ninja
}

package() {
  cd $srcdir/$_gitname/build
  DESTDIR=${pkgdir} ninja install
}

# vim: ts=2 sw=2 et:
