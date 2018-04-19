# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: alainm23 <https://github.com/alainm23, https://twitter.com/alainm23>

pkgname=planner-eos
pkgver=46.f32f6b2
pkgrel=1
_gitname=planner
pkgdesc='Project manager designed for elementary OS.'
arch=('i686' 'x86_64')
url='https://github.com/alainm23/planner'
license=('GPL3')
depends=('vala' 'granite' 'gtk3' 'glib2' 'sqlite')
optdepends=()
makedepends=('git' 'meson')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%}.install"
source=('git+https://github.com/alainm23/planner.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname

  if [[ -d build ]]; then
    rm -rf build
  fi
  
  meson build --prefix=/usr && cd build
}

package() {
  cd $srcdir/$_gitname
  env DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et:
