pkgname=malcontent
pkgver=0.5.0
pkgrel=1
pkgdesc="libmalcontent implements parental controls support which can be used by applications to filter or limit the access of child accounts to inappropriate content."
url="https://gitlab.freedesktop.org/pwithnall/malcontent"
arch=(x86_64)
license=(LGPL2.1)
depends=('accountsservice' 'dbus' 'gvfs' 'glib2' 'polkit')
makedepends=('accountsservice' 'dbus' 'gvfs' 'glib2' 'polkit')
provides=('malcontent')
conflicts=('malcontent')
_commit=cb27d756451cc3856d5101477912dc06c9ec0c9b
source=("git+https://gitlab.freedesktop.org/pwithnall/malcontent.git#commit=$_commit") # tags/0.5.0^0
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -dm750 "$pkgdir/usr/share/polkit-1/rules.d"
}
