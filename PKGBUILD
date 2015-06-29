# Maintainer: aksr <aksr at t-com dot me>
pkgname=gitfiles-git
pkgver=0.1.r2.e2d9fbd
pkgrel=1
epoch=
pkgdesc="Provides support for browsing Git repositories inside Acme."
arch=('i686' 'x86_64')
url="https://github.com/mariusae/gitfiles"
license=('custom')
groups=()
depends=('plan9port')
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
source=("$pkgname::git+https://github.com/mariusae/gitfiles.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i "1s|.*|#!$PLAN9/bin/rc|" gitfileget gitfileshow gitfilestat
}

build() {
  cd "$srcdir/$pkgname"
  mk
}

package() {
  cd "$srcdir/$pkgname"
  PLAN9=$pkgdir/$PLAN9
  mkdir -p $PLAN9/bin
  BIN=$PLAN9/bin mk install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

