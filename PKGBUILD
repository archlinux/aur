# Maintainer: aksr <aksr at t-com dot me>
pkgname=es-shell-git
pkgver=0.9.1.r7.gcb395c2
pkgrel=1
epoch=
pkgdesc="A extensible shell with higher-order functions, derived from the Plan 9 shell, rc."
arch=('i686' 'x86_64')
url="https://github.com/wryun/es-shell"
license=('Public Domain')
categories=()
groups=()
depends=()
makedepends=('git')
optdepends=('termcap: for mksignal')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=${pkgname%-*-*}.install
source=("$pkgname::git+https://github.com/wryun/es-shell.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  aclocal
  autoconf
  libtoolize -qi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr" install
  mkdir -p $pkgdir/usr/share/{doc,licenses}/${pkgname%-*-*}
  install -m644 README.md initial.es mksignal esdebug \
    doc/usenix-w93.ps doc/ERRATA doc/TODO "$pkgdir/usr/share/doc/${pkgname%-*-*}"
  sed '37,42!d' README.md > "$pkgdir"/usr/share/licenses/${pkgname%-*-*}/LICENSE
}

