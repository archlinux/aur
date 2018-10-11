# Maintainer: Julian Gwywitz <aur@geigi.de>+

pkgname=cozy-audiobooks
_gitname=cozy
pkgdesc=' A modern audio book player for Linux using GTK+ 3.'
pkgver=0.6.1b
pkgrel=1
url='https://github.com/geigi/cozy'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('meson' 'ninja')
depends=(
  'appstream-glib' 'desktop-file-utils' 'gst-python'
  'gstreamer' 'gtk3' 'python-dbus' 'python-gobject' 'python-mutagen' 'python-cairo' 'python-peewee' 'file' 'gst-plugins-good'
)
source=(
  "https://github.com/geigi/cozy/archive/${pkgver}.tar.gz"
  
)
sha256sums=(
  'bb609366adbcedad0473a7a6ecfcfe811c365018e72745877c7ed03746c01da2'
)

build() {
    cd "cozy-${pkgver}"
    meson \
      --buildtype='release' \
      --prefix='/usr' \
      build
    ninja -C build
}

package() {
    cd "cozy-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}
