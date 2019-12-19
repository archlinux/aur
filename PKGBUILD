pkgname=malcontent-git
_pkgname=malcontent
pkgver=0.4.0+6+gc3fdc05
pkgrel=1
pkgdesc="libmalcontent implements parental controls support which can be used by applications to filter or limit the access of child accounts to inappropriate content."
url="https://gitlab.freedesktop.org/pwithnall/malcontent"
arch=(x86_64)
license=(LGPL2.1)
depends=('accountsservice' 'dbus' 'gvfs' 'glib2' 'polkit')
makedepends=('accountsservice' 'dbus' 'gvfs' 'glib2' 'polkit')
provides=('malcontent')
conflicts=('malcontent')
source=("git+https://gitlab.freedesktop.org/pwithnall/malcontent")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -dm750 "$pkgdir/usr/share/polkit-1/rules.d"
}
