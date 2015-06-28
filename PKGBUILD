# Maintainer: aksr <aksr at t-com dot me>
pkgname=pick-git
pkgver=1.1.1.r2.gafecec0
pkgrel=1
epoch=
pkgdesc="Fuzzy select anything."
arch=('i686' 'x86_64')
url="https://github.com/thoughtbot/pick"
license=('MIT')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('pick')
conflicts=('pick')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/thoughtbot/pick")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

