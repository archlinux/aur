# Maintainer: Julian Gwywitz <aur@geigi.de>+

pkgname=cozy-audiobooks
_gitname=cozy
pkgdesc=' A modern audio book player for Linux using GTK+ 3.'
pkgver=0.4.9
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
  'b1fbe97abe0946eb9ae720b865251e72aac3dbadc1100a5e6df12e90d4f6b1be'
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
