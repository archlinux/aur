# Maintainer: Popolon <popolon@popolon.org>
name=directfb2-tools
pkgname=directfb2-tools-git
pkgver=r4.5ad91ce
pkgrel=1
pkgdesc="Various DirectFB utilities"
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url='https://directfb2.github.io/'
license=('LGPL')
makedepends=('git' 'meson' 'ninja' 'flux-git')
depends=('directfb2-git')
source=("${name}::git+https://github.com/directfb2/DirectFB2-tools.git")
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
