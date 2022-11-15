# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
_basename=drone-monitor
pkgname=${_basename}-git
pkgver=r44.f315867
pkgrel=1
pkgdesc="Monitor your drone like a pro"
arch=('x86_64')
url="https://github.com/puceaulytech/drone-monitor"
license=('MIT')
groups=()
depends=('qt6-3d' 'qt6-base')
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_basename}")
conflicts=("${_basename}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/puceaulytech/drone-monitor.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${_basename}" \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
