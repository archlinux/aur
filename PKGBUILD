# Maintainer: Julian Gwywitz <aur@geigi.de>+
# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=cozy-audiobooks
_gitname=cozy
pkgdesc=' A modern audio book player for Linux using GTK+ 3.'
pkgver=0.9.5
pkgrel=1
url='https://github.com/geigi/cozy'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('meson' 'ninja' 'libhandy')
depends=(
  'appstream-glib' 'desktop-file-utils' 'gst-python'
  'gstreamer' 'gtk3' 'python-dbus' 'python-distro' 'python-requests' 'python-pytz' 'python-gobject' 'python-mutagen' 'python-cairo' 'python-peewee' 'python-packaging' 'file' 'gst-plugins-good' 'libhandy'
)
source=( "https://github.com/geigi/cozy/archive/${pkgver}.tar.gz")
sha256sums=('4a7fdd7fead6e74aaaa3eab1589f13a88a99a25e5c9c4f0ed6b1f0ee901630c3')

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
