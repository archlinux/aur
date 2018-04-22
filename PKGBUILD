# Maintainer: aksr <aksr at t-com dot me>
pkgname=tokenizer-git
pkgver=r75.0602585
pkgrel=1
epoch=
pkgdesc="Convert source code into numerical tokens"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/tokenizer"
license=('Apache')
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
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/src"
  make
}

check() {
  cd "$srcdir/$pkgname/src"
  make test
}

package() {
  cd "$srcdir/$pkgname/src"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -D -m644 ../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 ../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

