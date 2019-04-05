# Maintainer: aksr <aksr at t-com dot me>
pkgname=agrep-git
pkgver=r33.7b7f350
pkgrel=2
epoch=
pkgdesc="Approximate GREP for fast fuzzy string searching."
arch=('i686' 'x86_64')
url="https://github.com/Wikinaut/agrep"
license=('ISC')
groups=()
depends=()
makedepends=('git' 'unzip')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/Wikinaut/agrep")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 agrep "$pkgdir/usr/bin/agrep"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYRIGHT"
  cd docs/
  unzip -d $pkgname agrep-and-glimpse-docs.zip
  install -Dm644 $pkgname/agrep.1 "$pkgdir/usr/share/man/man1/agrep.1"
}

