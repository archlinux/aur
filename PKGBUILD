# Maintainer: Popolon <popolon@popolon.org>
_name=directfb2-eglgbm
pkgname=directfb2-eglgbm-git
pkgver=r13.6a46274
pkgrel=3
pkgdesc="EGL system module for DirectFB2 and supported on GBM (Generic Buffer Manager) platforms."
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://directfb2.github.io/'
license=('LGPL')
makedepends=('git' 'meson' 'ninja' 'flux-git')
depends=('directfb2-git' 'libdrm' 'libglvnd' 'mesa')
source=("${_name}::git+https://github.com/directfb2/DirectFB2-eglgbm.git")
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
