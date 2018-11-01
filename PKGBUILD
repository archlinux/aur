# Maintainer: Yannick Inizan <inizan[dot]yannick[at]gmail[dot]com>

pkgname=libgxml-git
pkgver=0.16.0
pkgrel=1
pkgdesc="GObject API for XML manipulation and serialization library"
url="https://gitlab.gnome.org/BZHDeveloper/gxml/"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=('libgee-git-alt')
makedepends=('vala' 'meson' 'ninja')

provides=('libgxml='$pkgver)
conflicts=('libgxml')

source=('git+https://gitlab.gnome.org/BZHDeveloper/gxml.git')
sha256sums=('SKIP')

_gitname='gxml'

pkgver() {
  cd $_gitname
  git checkout origin/css-selectors
  version=$(grep 'project(' meson.build | awk -F\' '{print $8}' -)
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  git checkout origin/css-selectors
  mkdir build
  cd build
  meson .. --prefix=/usr
  ninja
}

package() {
  cd $_gitname
  cd build
  DESTDIR="$pkgdir" ninja install
}
