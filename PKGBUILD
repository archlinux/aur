# Maintainer: Maxime Gauduin <shlomochoina@gmail.com>

pkgname=wingpanel-indicator-nightlight-git
pkgver=r4.1f73747
pkgrel=1
pkgdesc='nightlife indicator'
_gitname=wingpanel-indicator-nightlight
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-a11y')
conflicts=('wingpanel-indicator-a11y')
replaces=('wingpanel-indicator-a11y-bzr')
source=("git+https://github.com/elementary/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd ${srcdir}/${_gitname}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd ${srcdir}/${_gitname}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
