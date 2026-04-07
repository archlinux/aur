# Maintainer: sfs <sfslinux@gmail.com>

pkgname=gcolor3-grim
pkgver=2.4.0
pkgrel=1
pkgdesc="GTK3 color picker with Wayland grim/slurp eyedropper"
arch=('x86_64')
url="https://www.hjdskes.nl/projects/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'grim' 'slurp')
provides=('gcolor3')
conflicts=('gcolor3')
makedepends=('meson' 'ninja' 'gettext' 'intltool' 'pkgconf')
_srcdir="gcolor3-v${pkgver}"
source=(
  "https://gitlab.gnome.org/World/gcolor3/-/archive/v${pkgver}/gcolor3-v${pkgver}.tar.gz"
  'wayland-grim.patch'
  'gcolor3.po'
)
sha256sums=('d6071390a0980fb8eb8418750766c744cf0bca56f24ab4dbe3f23cb1ffd1973d'
            '7ab815ffba19baa782163958cb2e77a40c4fd2b6b6d3153f8b1025c3414cd91c'
            '0a078e02534e51a59c2b63a3c446a60a622c95eeee3a5c5766ba00ebe385f7fd')

prepare() {
  cd "${_srcdir}"
  patch -Np1 -i "${srcdir}/wayland-grim.patch"
  cp -f "${srcdir}/gcolor3.po" po/ru.po
}

build() {
  cd "${_srcdir}"
  meson setup build --prefix=/usr -Dwerror=false
  meson compile -C build
}

package() {
  cd "${_srcdir}"
  DESTDIR="${pkgdir}" meson install -C build
}
