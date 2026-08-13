# Maintainer: tiandic <2323748675@qq.com>

pkgname=easycut-git
pkgver=r105.18fccaf
pkgrel=1
pkgdesc="A simple software for doing basic video editing tasks"
arch=('i686' 'x86_64')
url="https://github.com/tiandic/easyCut"
license=('GPL')
depends=(
  qt6-declarative
  qt6-multimedia
  ffmpeg
)
makedepends=(
  base-devel
  cmake
  git
)
provides=('easycut')
provides=('easycut')
source=("$pkgname::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  cmake -B build
  cmake --build build
}

package() {
  cd "$pkgname"
  install -vDm755 build/appeasyCut -t "$pkgdir/usr/bin/"
  install -vDm755 build/exec_cmd/exec_cmd -t "$pkgdir/usr/lib/easyCut/"
  install -vDm755 build/exec_cmd_gui/appexec_cmd_gui -t "$pkgdir/usr/lib/easyCut/"
}
