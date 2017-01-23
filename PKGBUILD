# Maintainer: aksr <aksr at t-com dot me>
pkgname=grcompiler-git
pkgver=r458.c15fa64
pkgrel=1
epoch=
pkgdesc="The SIL Graphite compiler"
arch=('i686' 'x86_64')
url="https://github.com/silnrsi/grcompiler"
license=('custom' 'GPL' 'LGPL' 'CPL')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('grcompiler')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/silnrsi/grcompiler.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -vi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -d $pkgdir/usr/share/licenses/${pkgname%-*}/
  cp -a license/* "$pkgdir/usr/share/licenses/${pkgname%-*}"
}

