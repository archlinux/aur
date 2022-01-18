# Maintainer: Nova King <technobaboo@protonmail.com>

pkgname=stardust-xr-git
_pkgname=stardust-xr
pkgver=r656.ec7be6b
pkgrel=1

pkgdesc="Reference server implementation for Stardust XR using StereoKit"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://stardustxr.org/"
license=('GPL2')

provides=('stardust-xr')
depends=('openxr>=1.0.16' 'fontconfig' 'libegl' 'libgl' 'flatbuffers>=1.12.0' 'libstardustxr' 'xcb-util-wm' 'xcb-util-errors' 'libxkbcommon' 'seatd' 'pixman')
makedepends=('git' 'meson>=0.55.0' 'ninja' 'cmake' 'wayland-protocols' 'xorgproto')

source=(git+https://github.com/StardustXR/stardust-xr.git#branch=dev)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson -D b_lto=false "stardust-xr" build
	meson compile -C build
}

package() {
	#meson install -C build --destdir "$pkgdir" --skip-subprojects
	meson install -C build --destdir "$pkgdir" --skip-subprojects
}
