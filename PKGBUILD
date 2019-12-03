# Maintainer: aksr <aksr at t-com dot me>
pkgname=bitwise-git
pkgver=0.40.r8.gc48b78e
pkgrel=1
epoch=
pkgdesc="Terminal based bit manipulator in ncurses"
arch=('i686' 'x86_64')
url="https://github.com/mellowcandle/bitwise"
license=('GPL3')
groups=()
depends=(ncurses readline)
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
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

