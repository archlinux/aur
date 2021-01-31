# Maintainer: Julian Gwywitz <aur@geigi.de>+
# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=cozy-audiobooks
_gitname=cozy
pkgdesc=' A modern audio book player for Linux using GTK+ 3.'
pkgver=0.8
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
sha256sums=('473bfbbb6a65beca654ed8aae6c09bddf326095857ce4dde641e1423b8a4685a')

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
