# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.4+33+g5ecfd0e
pkgrel=1
pkgdesc="Easily send files via mail"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/nautilus-sendto"
license=(GPL)
depends=(glib2)
makedepends=(gettext intltool gobject-introspection python2 gnome-common git)
options=('!emptydirs')
groups=('gnome-extra')
_commit=5ecfd0e69a7988d0a5a204c7c0070cab6136709f  # master
source=("git+https://git.gnome.org/browse/nautilus-sendto#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^NAUTILUS_SENDTO_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  # Fixup tags for pkgver()
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
