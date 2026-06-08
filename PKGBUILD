pkgname=xfce4-diskperf-plugin-git
_pkgname=${pkgname%-git}
pkgver=xfce4.diskperf.plugin.2.8.0.r124.g6d2e0ee
pkgrel=1
pkgdesc='Plugin for the Xfce4 panel displaying instant disk/partition performance'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-diskperf-plugin')
provides=('xfce4-diskperf-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git' 'meson')
options=('!libtool')
install=xfce4-diskperf-plugin.install
source=('git+https://gitlab.xfce.org/panel-plugins/xfce4-diskperf-plugin')
sha256sums=('SKIP')

pkgver() {
	  cd "$_pkgname"
	    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    }

build() {
  meson setup --prefix=/usr \
              --buildtype=plain \
              "$_pkgname" build

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
