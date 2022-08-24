# Maintainer: Popolon <popolon@popolon.org>
name=directfb2
pkgname=directfb2-git
pkgver=r88.eb7ab25c1
pkgrel=3
pkgdesc="a fork of DirectFB whose purpose is to preserve and maintain the DirectFB graphics backend, particularly for use on embedded systems."
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url="https://github.com/directfb2/DirectFB2"
license=('LGPL')
groups=()
makedepends=('git' 'meson' 'ninja' 'flux-git')
conflicts=(directfb)
provides=(directfb)
replaces=(directfb)
backup=()
options=()
install=
source=("directfb2::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${name}"
  meson -Dmulti=true -Dprefix=/usr build/
  ninja -C build/
}

package() {
  cd "${srcdir}/${name}"
  DESTDIR=${pkgdir} ninja -C build/ install
}
