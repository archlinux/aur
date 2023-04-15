# Maintainer: Paul <pb.orzel@proton.me>
pkgname=amdgpu_top-git
_pkgname=amdgpu_top
pkgver=v0.1.4.r3.g81ac9c2
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization"
arch=("any")
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=("MIT")
depends=(
  "glibc"
  "libdrm"
)
makedepends=(
	"cargo"
	"git"
)
source=("git+${url}")
conflicts=('amdgpu_top')
provides=('amdgpu_top')
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir/$_pkgname"
	cargo build --release
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 target/release/amdgpu_top "${pkgdir}/usr/bin/amdgpu_top"
}
