# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-applets-git
_pkgname=gnome-applets
pkgver=3.20.0.r9.gea315cd
pkgrel=1
pkgdesc="Small applications for the GNOME Panel (git version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/GnomeApplets"
license=('GPL')
depends=('gnome-panel' 'libgtop' 'libtracker-sparql' 'gucharmap' 'python-gobject' 'cpupower' 'upower')
makedepends=('git' 'autoconf-archive' 'intltool' 'yelp-tools' 'gnome-settings-daemon')
conflicts=($_pkgname)
provides=($_pkgname)
source=(git://git.gnome.org/gnome-applets)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/^GNOME_APPLETS_//;s/([^-]*-g)/r\1/;s/[-_]/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
               --disable-schemas-compile --with-cpufreq-lib=cpupower --disable-Werror
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  python3 -m compileall "$pkgdir"/usr/lib/python3.5/site-packages/invest/
}
