# Maintainer: aksr <aksr at t-com dot me>
pkgname=libavlbst-git
pkgver=2.1.0.r18.6e7bfca
pkgrel=1
epoch=
pkgdesc="General purpose AVL binary search tree library."
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/libavlbst"
license=('BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('libavlbst')
conflicts=('libavlbst')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/libavlbst.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g')" \
                    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INCDIR=$pkgdir/usr/include \
       LIBDIR=$pkgdir/usr/lib \
       MANDIR=$pkgdir/usr/share/man install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

