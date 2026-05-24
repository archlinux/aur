# Maintainer: EstoyAburridow <coquicaracoco@gmail.com>
pkgname='estoys-custom-xfce4-docklike-plugin-git'
pkgver=r1216.258bbe9
pkgrel=1
pkgdesc="Fork of the docklike plugin with support for notification badges"
arch=('x86_64')
url="https://gitlab.xfce.org/EstoyAburridowGH/xfce4-docklike-plugin"
license=('GPL3')
depends=('cairo' 'exo' 'glib2' 'gtk3' 'libxfce4ui' 'libxfce4windowing' 'xfce4-panel')
makedepends=('git' 'meson' 'xfce4-dev-tools')
optdepends=('libunity: Required by some programs to have badge notifications')
provides=("xfce4-docklike-plugin")
conflicts=("xfce4-docklike-plugin")
source=("${pkgname%-git}::git+https://gitlab.xfce.org/EstoyAburridowGH/xfce4-docklike-plugin.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "${pkgname%-git}" build
    meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
