# Maintainer: Andrey Vetrov <vetrov at mail dot ru>

pkgname=epdfview-gtk3
pkgver=0.2.0
pkgrel=1
pkgdesc='Lightweight PDF document viewer. GTK3 version.'
url='https://github.com/Flow-It/epdfview'
arch=('x86_64')
license=('GPL2')
provides=('epdfview')
conflicts=('epdfview')
replaces=('epdfview')
depends=('gtk3' 'poppler-glib' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'ninja' 'doxygen')
source=("git+https://github.com/Flow-It/epdfview.git"
        'patch.txt')
md5sums=('SKIP' 'SKIP')

prepare() {
    cd "${srcdir}/${pkgname%-*}"
    patch -Np1 -i ../patch.txt
}

build() {
  mkdir build
  meson --prefix=/usr \
        --buildtype=plain \
          "${srcdir}/${pkgname%-*}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
