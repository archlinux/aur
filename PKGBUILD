# Maintainer: aksr <aksr at t-com dot me>
pkgname=tsvm-git
pkgver=r2.8795ff0
pkgrel=1
epoch=
pkgdesc="A simple virtual machine for the intermediate code of TSLANG (The Simple Language)."
arch=('i686' 'x86_64')
url="https://github.com/aligrudi/tsvm"
license=('ISC')
categories=()
groups=()
depends=('')
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
source=("$pkgname::git+https://github.com/aligrudi/tsvm.git")
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

check() {
  cd "$srcdir/$pkgname"
  ./test.sh
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 tsvm $pkgdir/usr/bin/tsvm
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  sed '1,17!d' tsvm.c > LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

