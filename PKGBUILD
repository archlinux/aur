# Maintainer: aksr <aksr at t-com dot me>
pkgname=rs-git
pkgver=1.22.r0.g716edb0
pkgrel=2
epoch=
pkgdesc="Reshape a data array from OpenBSD that compiles on Linux."
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/rs"
license=('BSD')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/chneukirchen/rs")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 rs $pkgdir/usr/bin/rs
  install -Dm644 rs.1 $pkgdir/usr/share/man/man1/rs.1 
  sed '8,34!d' README > LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

