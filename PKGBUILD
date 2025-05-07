# Maintainer: Luke Short <ekultails@gmail.com>
pkgname=pifs-aya-git
pkgver=r38.f29c8d8
pkgrel=2
epoch=
pkgdesc="pifs - the data-free filesystem (modern fork from aya)!"
arch=('i686' 'x86_64')
url="https://github.com/aya/pifs"
license=('GPLv3')
categories=()
groups=()
depends=('fuse3')
makedepends=('git')
optdepends=()
checkdepends=()
provides=("pifs")
conflicts=("pifs-git")
replaces=("pifs-git")
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/aya/pifs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  sed -i 's/-Werror/-Wno-error/'g ./configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
