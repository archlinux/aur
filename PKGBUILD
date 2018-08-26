# Maintainer: aksr <aksr at t-com dot me>
pkgname=btyacc-git
pkgver=3.0.r49.gdf8cbab
pkgrel=1
epoch=
pkgdesc="Backtracking yacc"
arch=('i686' 'x86_64')
url="https://github.com/ChrisDodd/btyacc"
license=('custom')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=("${pkgname%-*}")
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
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 btyacc $pkgdir/usr/bin/btyacc
  install -D -m644 manpage $pkgdir/usr/share/man/man1/btyacc.1
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 README.BYACC $pkgdir/usr/share/doc/${pkgname%-*}/README.BYACC
  install -Dm644 CHANGELOG $pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG
  sed '64,$!d' README > LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

