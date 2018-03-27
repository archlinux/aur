# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Joost Bremmer <toost.b@gmail.com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=mpdris2-py3-git
pkgver=0.7.r48.g1231f84
pkgrel=1
pkgdesc="MPRIS2 support for MPD using Python 3 -- git version"
url="https://github.com/eonpatapon/mpDris2"
arch=('any')
license=('GPL3')
depends=('python-dbus'
         'python-mpd2'
         'libnotify'
         'python-gobject')
provides=('mpdris2')
conflicts=('mpdris2')
makedepends=('git' 'intltool')
optdepends=(
  'mutagen: read covers from music files'
  'python-gobject: Gnome notifications and media keys'
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
