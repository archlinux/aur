# Maintainer: aksr <aksr at t-com dot me>
pkgname=pifs-git
pkgver=r21.3d9cc9d
pkgrel=1
epoch=
pkgdesc="πfs - the data-free filesystem!"
arch=('i686' 'x86_64')
url="https://github.com/philipl/pifs"
license=('GPLv3')
categories=()
groups=()
depends=('fuse2')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/philipl/pifs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

