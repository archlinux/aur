# Maintainer: aksr <aksr at t-com dot me>
pkgname=m4acut-git
pkgver=0.1.2.r5.gf8b8823
pkgrel=1
epoch=
pkgdesc="Losslessly & gaplessly cut m4a (AAC in MP4) files. "
arch=('i686' 'x86_64')
url="https://github.com/nu774/m4acut"
license=('Zlib' 'BSD-4-clause')
categories=()
groups=()
depends=('l-smash')
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
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

