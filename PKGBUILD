pkgname=ring-gnome-git
pkgver=98.66c50a3
pkgrel=3
pkgdesc="distributed and secured communications"
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.ring.cx/"
depends=('libringclient' 'evolution-data-server' 'clutter-gtk' 'gnome-icon-theme-symbolic')
makedepends=('cmake')
install=('ring-gnome.install')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-client-gnome")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/ring-client-gnome
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${srcdir}/ring-client-gnome"

}

build() {
  cd "${srcdir}/ring-client-gnome"
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/ring-client-gnome"
  make DESTDIR="$pkgdir" install
}
