# Maintainer: Popolon <popolon@popolon.org>
_name=directfb2-tslib
pkgname=directfb2-tslib-git
pkgver=r13.ce00eca
pkgrel=2
pkgdesc="contains tslib input driver for DirectFB2"
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://directfb2.github.io/'
license=('LGPL')
makedepends=('git' 'meson' 'ninja' 'flux-git')
depends=('directfb2-git')
source=("${_name}::git+https://github.com/directfb2/DirectFB2-tslib.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_name}"
  meson setup -Dprefix=/usr build/
  ninja -C build/
}

package() {
  cd "${srcdir}/${_name}"
  DESTDIR=${pkgdir} ninja -C build/ install
}
