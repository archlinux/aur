# Maintainer: Paul <p.orzel@gmx.de>
pkgname=amdgpu_top-git
_pkgname=amdgpu_top
pkgver=r87.e80c558
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization"
arch=("any")
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=("MIT")
depends=(
  "glibc"
  "libdrm"
  "ncurses"
)
makedepends=("cargo")
source=("git+${url}")
conflicts=('amdgpu_top')
provides=('amdgpu_top')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/$_pkgname"
	cargo build --release
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 target/release/amdgpu_top "${pkgdir}/usr/bin/amdgpu_top"
}
