# Maintainer: Julian Gwywitz <aur@geigi.de>+
# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=cozy-audiobooks
_gitname=cozy
pkgdesc=' A modern audio book player for Linux using GTK+ 3.'
pkgver=0.7.2
pkgrel=1
url='https://github.com/geigi/cozy'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('meson' 'ninja')
depends=(
  'appstream-glib' 'desktop-file-utils' 'gst-python'
  'gstreamer' 'gtk3' 'python-dbus' 'python-distro' 'python-requests' 'python-pytz' 'python-gobject' 'python-mutagen' 'python-cairo' 'python-peewee' 'python-apsw' 'file' 'gst-plugins-good'
)
source=( "https://github.com/geigi/cozy/archive/${pkgver}.tar.gz")
sha256sums=('984508506c9907c765f75f8042249ff3a95db7e6407e7a66338fd52384ac797f')

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
