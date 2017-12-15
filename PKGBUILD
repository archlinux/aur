# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=wxglterm-git
_pkgname=wxglterm
pkgver=r179.a3869ea
pkgrel=1
pkgdesc="a cross platform terminal emulator using wxWidgets and python, drawing using OpenGL"
arch=('x86_64')
url="https://github.com/stonewell/wxglterm"
license=('MIT')
depends=('wxgtk3')
makedepends=('git' 'cmake' 'pybind11') # 'bzr', 'git', 'mercurial' or 'subversion'
options=()
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare (){
  cd "${srcdir}/${_pkgname}"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}
build() {
  #you need to go into $srcdir/build and do it manually
  cd "${srcdir}/${_pkgname}"
  export LDFLAGS="$LDFLAGS -lutil"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/libpython3.6m.a
    make

}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
