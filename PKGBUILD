# Maintainer: Popolon <popolon@popolon.org>
_name=directfb2-lite
pkgname=directfb2-lite-git
pkgver=r25.164bb5e
pkgrel=2
pkgdesc="Lightweight Toolkit Enabler is a simple user interface library on top of DirectFB"
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://directfb2.github.io/'
license=('LGPL')
makedepends=('git' 'meson' 'ninja' 'flux-git')
depends=('directfb2-git')
source=("${_name}::git+https://github.com/directfb2/LiTE.git")
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
