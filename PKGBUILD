# Maintainer: aksr <aksr at t-com dot me>
pkgname=bic-git
pkgver=r604.936a40d
pkgrel=1
epoch=
pkgdesc="A C interpreter and API explorer."
arch=('i686' 'x86_64')
url="https://github.com/hexagonal-sun/bic"
license=('GPL')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr --enable-debug
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/${pkgname%-*}/img
  cp -a doc/img/* "$pkgdir/usr/share/doc/${pkgname%-*}/img"
  sed -i 's@doc/img/@img/@g' README.org
  install -D -m644 README.org $pkgdir/usr/share/doc/${pkgname%-*}/README.org
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

