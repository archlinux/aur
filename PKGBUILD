# Maintainer : haagch <christoph.haag@collabora.com>
# Contributor : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor : Felix Yan <felixonmars@archlinux.org>
# Contributor : Andrea Scarpino <andrea@archlinux.org>
# shellcheck disable=SC2034

pkgname=qt5-quick3d-git
pkgver=r837.10f50fb
pkgrel=1
arch=('x86_64')
url='https://git.qt.io/annichol/qtquick3d/'
license=('GPL3')
pkgdesc='a high level 3D API for Qt Quick to introduce 3D content into Qt Quick applications'
depends=('qt5-declarative')
makedepends=()
groups=('qt' 'qt5')
source=("git+https://git.qt.io/annichol/qtquick3d.git")
sha256sums=('SKIP')

pkgver() {
  cd qtquick3d
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../qtquick3d
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
