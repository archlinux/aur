# Maintainer: Nomadcxx <noovie@gmail.com>
# Arch's scenefx 0.5 plus a fix that stops blur passes re-importing their
# effect buffers on every draw (https://github.com/wlrfx/scenefx/pull/237).
pkgname=scenefx-sysc
_tag=0.5-sysc1
pkgver=0.5.sysc1
pkgrel=1
pkgdesc="SceneFX 0.5 with faster blur effect buffers, for sysc-compositor"
url="https://github.com/Nomadcxx/scenefx"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'lcms2' 'libdrm' 'libglvnd' 'libxkbcommon' 'mesa' 'pixman' 'wayland' 'wlroots0.20')
makedepends=('glslang' 'meson' 'wayland-protocols')
provides=('scenefx=0.5' 'libscenefx-0.5.so')
conflicts=('scenefx')
install=scenefx-sysc.install
source=("scenefx-${_tag}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('d4fc187a6d0185f026d48309a1b2dc9d3d1570926a3deb33f83665e8f2db269e')

build() {
	arch-meson "scenefx-${_tag}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm 644 "scenefx-${_tag}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
