# Maintainer: aksr <aksr at t-com dot me>
pkgname=xe-git
pkgver=0.11.r2.ga3fd526
pkgrel=1
epoch=
pkgdesc="Simple xargs and apply replacement"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/xe"
license=('custom:public domain')
categories=()
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
source=("$pkgname::git+https://github.com/chneukirchen/xe.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr BINDIR=/usr/bin MANDIR=/usr/share/man install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  sed '1,9!d' xe.c > LICENSE
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

