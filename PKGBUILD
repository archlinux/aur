# Maintainer: Popolon <popolon@popolon.org>
name=directfb2-gles2
pkgname=directfb2-gles2-git
pkgver=r7.fe03aa2
pkgrel=1
pkgdesc="OpenGL ES 2.0 GFX driver for DirectFB2"
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://directfb2.github.io/'
license=('LGPL')
makedepends=('git' 'meson' 'ninja' 'flux-git')
depends=('directfb2-git' 'mesa')
source=("${name}::git+https://github.com/directfb2/DirectFB2-gles2.git")
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
