pkgname=grilo-plugins-git
_pkgname=grilo-plugins
pkgver=0.3.11+14+g29c5590
pkgrel=1
pkgdesc="A collection of plugins for the Grilo framework"
url="https://gitlab.gnome.org/GNOME/grilo-plugins"
arch=(x86_64)
license=(LGPL)
depends=('grilo' 'lua' 'libmediaart' 'libgdata' 'tracker' 'gom' 'libdmapsharing' 'chromaprint'
         'gst-plugins-bad' 'gmime3')
makedepends=('git' 'meson' 'gperf' 'yelp-tools')
checkdepends=('gst-plugins-good' 'gst-plugins-base')
optdepends=('dleyna-server: DLNA plugin'
            'tracker-miners: Tracker plugin')
provides=('grilo-plugins')
conflicts=('grilo-plugins')
source=("git+https://gitlab.gnome.org/GNOME/grilo-plugins.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^grilo-plugins-//;s/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  depends+=(libgr{ilo,lnet,lpls}-0.3.so)
  DESTDIR="$pkgdir" meson install -C build
}
