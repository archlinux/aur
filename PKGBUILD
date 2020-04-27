# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cozy-audiobooks-git
_gitname=cozy
pkgdesc='A modern audio book player for Linux and macOS using GTK+ 3'
pkgver=0.6.16.r27.ge4ddbfc
pkgrel=1
url='https://cozy.geigi.de'
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('appstream-glib'
         'desktop-file-utils'
         'gst-python'
         'gstreamer'
         'gtk3'
         'python-dbus'
         'python-distro'
         'python-requests'
         'python-pytz'
         'python-gobject'
         'python-mutagen'
         'python-cairo'
         'python-peewee'
         'gst-plugins-good')
makedepends=('meson' 'ninja' 'git')
source=("git+https://github.com/geigi/cozy")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/cozy"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/cozy"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "${srcdir}/cozy"
  DESTDIR="${pkgdir}" ninja -C build install
}