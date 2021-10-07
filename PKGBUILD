# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Joost Bremmer <toost.b@gmail.com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=mpdris2-git
pkgver=0.9.1.r0.g09e3371
pkgrel=1
pkgdesc="MPRIS2 support for MPD -- git version"
url="https://github.com/eonpatapon/mpDris2"
arch=('any')
license=('GPL3')
depends=('python-dbus' 'python-mpd2' 'python-gobject')
provides=('mpdris2')
conflicts=('mpdris2')
makedepends=('git' 'intltool')
optdepends=(
  'python-mutagen: read covers from music files'
  'libnotify: notifications on track change'
)
source=("mpDris2::git+https://github.com/eonpatapon/mpDris2")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mpDris2"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/mpDris2"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/mpDris2"
  make DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
