# Maintainer: aksr <aksr at t-com dot me>
pkgname=ad-git
pkgver=r229.56a366e
pkgrel=1
epoch=
pkgdesc="ASCII file dump that can also search for and highlight strings or numbers."
arch=('i686' 'x86_64')
url="https://github.com/paul-j-lucas/ad"
license=('GPL')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('ad')
conflicts=('ad')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/paul-j-lucas/ad.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

