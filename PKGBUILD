# Contributor: Max Devaine <max@devaine.cz>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=code-eli-git
pkgver=r821.f9ff74f
pkgrel=2
pkgdesc='Collection of C++ libraries that provide a variety of functionalities.'
arch=('i686' 'x86_64')
url='https://github.com/ramcdona/Code-Eli'
license=('EPL 1.0')
depends=('eigen')
optdepends=('cpptest: unit tests'
            'doxygen: documentation')
makedepends=('cmake' 'git')
_name=Code-Eli
provides=('code-eli')
conflicts=('')
source=("git+https://github.com/ramcdona/Code-Eli.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_buildtype="Release"

build() {

  msg "Starting CMake (build type: ${_buildtype})"

  cd "${srcdir}/${_name}/"

  cmake . \
    -DCMAKE_PREFIX_PATH='/usr' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  msg "Building the project"
  make
}


package() {
  msg "Installing files"

  mkdir $pkgdir/usr
  cp -a $srcdir/${_name}/include $pkgdir/usr/
  chown -R root:root $pkgdir/usr
  chmod -R 755 $pkgdir/usr
}

