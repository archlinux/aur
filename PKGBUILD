# Maintainer: linuxer <linuxer@artixlinux.org>
# Contributor: linuxer <linuxer@artixlinux.org>
# Maintainer: Lucas Saliés Brum <lucas at archlinux dot com dot br>
# Contributor: Tobias Frilling <tobias at frilling-online dot de>
# Contributor: Ekenbrand <jesu dot critos at gmail>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>
# Maintainer: Tasos Sahanidis <aur@tasossah.com>

pkgname=alarm-clock-applet
pkgver=0.4.1
pkgrel=3
epoch=1
pkgdesc="A fully-featured alarm clock for use with an AppIndicator implementation."
arch=('x86_64' 'i686')
_alias=alarm-clock
url="https://alarm-clock-applet.github.io/"
license=('GPL2')
depends=('gettext' 'gstreamer>=1.0' 'gst-plugins-base' 'gst-plugins-good' 'libnotify>=0.4.1' 'glib2' 'gtk3' 'libayatana-appindicator')
makedepends=('cmake' 'pkgconfig' 'perl' 'gzip' 'python')
optdepends=('gnome-control-center' 'playerctl' 'gconf>=2.0')
install=$pkgname.install
source=($_alias-$pkgver.tar.gz::https://github.com/alarm-clock-applet/alarm-clock/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('9c7e6cb068e042f1dbb425d3d8dee61dcf3ef34b931099e7c301945234cf15196ed10da0f3de134f62ea92ef0edee6c54fbd5e95c89a8e38f99e6ff3a32bea94')
conflicts=('alarm-clock-applet-git')

build() {
  cmake -B build -S "$_alias-$pkgver" -DCMAKE_BUILD_TYPE=None -DALLOW_MISSING_GCONF=1 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
