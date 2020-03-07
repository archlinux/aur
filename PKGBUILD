pkgname=gnome-getting-started-docs-git
_pkgname=gnome-getting-started-docs
pkgver=3.35.92
pkgrel=1
pkgdesc="Help a new user get started in GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-getting-started-docs"
license=(CCPL:by-sa)
arch=(any)
depends=('yelp' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('yelp-tools' 'git')
provides=('gnome-getting-started-docs')
conflicts=('gnome-getting-started-docs')
source=("git+https://gitlab.gnome.org/GNOME/gnome-getting-started-docs.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
