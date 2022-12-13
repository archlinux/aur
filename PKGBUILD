# Maintainer: Popolon <popolon@popolon.org>
name=directfb2-eglgbm
pkgname=directfb2-eglgbm-git
pkgver=r7.c8d58a3
pkgrel=2
pkgdesc="EGL system module for DirectFB2 and supported on GBM (Generic Buffer Manager) platforms."
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://directfb2.github.io/'
license=('LGPL')
makedepends=('git' 'meson' 'ninja' 'flux-git')
depends=('directfb2-git')
source=("${name}::git+https://github.com/directfb2/DirectFB2-eglgbm.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${name}"
  meson setup -Dprefix=/usr build/
  ninja -C build/
}

package() {
  cd "${srcdir}/${name}"
  DESTDIR=${pkgdir} ninja -C build/ install
}
