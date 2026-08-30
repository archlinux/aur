# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=naevi-git
pkgver=r18.3a5b92d
pkgrel=1
pkgdesc="Vi-like modal terminal text editor written in ANSI C."
arch=('x86_64')
url="https://github.com/defnae/naevi"
license=('custom:NPL')
depends=('glibc')
makedepends=('git' 'clang' 'lld' 'llvm' 'make' 'coreutils')
provides=('naevi')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  unset CFLAGS
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/built/naevi "$pkgdir/usr/bin/naevi"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
