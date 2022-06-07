# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=spice-streaming-agent-git
pkgver=v0.3.r40.gadcbc83
pkgrel=2
pkgdesc="Guest agent to stream video from guest cards"
arch=("x86_64")
license=("APACHE")
depends=(pixman gstreamer gst-plugins-base xorg-xrandr)
makedepends=(spice-protocol meson pixman gstreamer gst-plugins-base xorg-xrandr python-six)
url="https://spice-space.org"
source=(
	"git+https://gitlab.freedesktop.org/spice/spice-streaming-agent.git"
	"git+https://gitlab.freedesktop.org/spice/spice-common.git"
)
sha512sums=(
	"SKIP"
	"SKIP"
)

pkgver() {
	cd "spice-streaming-agent"
	git describe --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
	cd "spice-streaming-agent"
	git config submodule.spice-common.url "${srcdir}/spice-common"
}

build() {
	meson --prefix /usr --buildtype=plain spice-streaming-agent build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
