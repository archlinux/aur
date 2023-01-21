# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: linuxer <linuxer@artixlinux.org>
# Contributor: Lucas Saliés Brum <lucas at archlinux dot com dot br>
# Contributor: Tobias Frilling <tobias at frilling-online dot de>
# Contributor: Ekenbrand <jesu dot critos at gmail>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>


pkgname=alarm-clock-applet-git
pkgver=0.4.1.r3.g6a11003
pkgrel=2
pkgdesc="A fully-featured alarm clock for use with an AppIndicator implementation."
arch=('x86_64' 'i686')
url="https://alarm-clock-applet.github.io/"
license=('GPL2')
depends=('gettext' 'gstreamer>=1.0' 'gst-plugins-base' 'gst-plugins-good' 'libnotify>=0.4.1' 'glib2' 'gtk3' 'libayatana-appindicator')
makedepends=('cmake' 'pkgconfig' 'perl' 'gzip' 'python' 'git')
optdepends=('gnome-control-center' 'playerctl' 'gconf>=2.0')
install=$pkgname.install
source=($pkgname::git+https://github.com/alarm-clock-applet/alarm-clock.git)
sha512sums=('SKIP')
conflicts=('alarm-clock-applet')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$pkgname" -DCMAKE_BUILD_TYPE=None -DALLOW_MISSING_GCONF=1 -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
