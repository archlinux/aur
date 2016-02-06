# Maintainer: aksr <aksr at t-com dot me>
pkgname=pachi-git
pkgver=11.00.retsugen.r37.g4eb631e
pkgrel=1
epoch=
pkgdesc="A fairly strong Go/Baduk/Weiqi playing program."
arch=('i686' 'x86_64')
url="https://github.com/pasky/pachi"
url="http://pachi.or.cz/"
license=('GPL')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('pachi')
conflicts=('pachi' 'pachi-go')
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/pasky/pachi.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^pachi\.//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

