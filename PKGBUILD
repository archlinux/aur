# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.4+41+gf790d15
pkgrel=1
pkgdesc="Easily send files via mail"
url="https://git.gnome.org/browse/nautilus-sendto"
arch=(i686 x86_64)
license=(GPL)
depends=(glib2)
makedepends=(gettext intltool gobject-introspection python2 gnome-common git)
groups=('gnome-extra')
_commit=f790d1583452bb5e934a919d98095ec4147f94d2  # master
source=("git+https://git.gnome.org/browse/nautilus-sendto#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^NAUTILUS_SENDTO_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  # Fixup tag mess
  git tag -f NAUTILUS_SENDTO_3_8_4 eaf083dec2846dc76f72d82755c65f6dc7bf3c86
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-schemas-compile
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
