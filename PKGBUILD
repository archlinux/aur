# Maintainer: RIley Trautman <asonix.dev@gmail.com>

_pkgname=relay
pkgname=$_pkgname-git
pkgver=r242.6e23ee4
pkgrel=1
pkgdesc='An IRC client built for elementary OS'
arch=('i686' 'x86_64')
url='https://github.com/agronick/Relay'
license=('GPL2')
depends=('libunity' 'sqlite')
makedepends=('libgee' 'glib2' 'gtk3' 'granite' 'vala' 'automake' 'libtool' 'libx11' 'patch' 'dee')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("$pkgname::git+https://github.com/agronick/Relay.git" "$pkgname.install" "dont-post-install.patch")
sha256sums=('SKIP' '85906d05b381bdaf1254dac7b4d43ae473af5e53bc447bddb2c4a9eb6c9cab1a' '1791eb4d2a529e7a872de6dda45210d7a0a4de5fc851d49fd43cd3d4cf883fe6')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/dont-post-install.patch"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
}
