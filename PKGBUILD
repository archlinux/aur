# Maintainer: aksr <aksr at t-com dot me>
pkgname=wrap-git
pkgver=r308.6cc2ad4
pkgrel=1
epoch=
pkgdesc="A filter for reformatting text by wrapping and filling lines to a given line-width."
arch=('i686' 'x86_64')
url="https://github.com/paul-j-lucas/wrap"
license=('GPL')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('wrap')
conflicts=('wrap')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/paul-j-lucas/wrap.git")
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

