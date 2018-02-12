# Maintainer: Julian Gwywitz <aur@geigi.de>+

pkgname=cozy-audiobooks
_gitname=cozy
pkgdesc=' A modern audio book player for Linux using GTK+ 3.'
pkgver=0.4.8
pkgrel=1
url='https://github.com/geigi/cozy'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('meson' 'ninja')
depends=(
  'appstream-glib' 'desktop-file-utils' 'gst-python'
  'gstreamer' 'gtk3' 'python-dbus' 'python-gobject' 'python-mutagen' 'python-peewee' 'gst-plugins-good'
)
source=(
  "https://github.com/geigi/cozy/archive/${pkgver}.tar.gz"
  
)
sha256sums=(
  '590aac154bd9249055e86edfa977f3f76ad061d654c1fc47bd40764f9c79bc01'
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
