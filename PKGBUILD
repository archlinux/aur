pkgname=gnome-user-docs-git
_pkgname=gnome-user-docs
pkgver=3.35.92+16+ga7bd575c
pkgrel=1
pkgdesc="User documentation for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-user-docs"
arch=(any)
license=(FDL)
depends=('yelp')
makedepends=('yelp-tools' 'git')
provides=('gnome-user-docs')
conflicts=('gnome-user-docs')
source=("git+https://gitlab.gnome.org/GNOME/gnome-user-docs.git")
sha256sums=('SKIP')

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
