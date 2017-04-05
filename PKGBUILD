# Maintainer: aksr <aksr at t-com dot me>
_pkgname=dada
pkgname=dadaengine
pkgver=1.03
pkgrel=2
epoch=
pkgdesc="A system for generating random text from grammars."
arch=('i686' 'x86_64')
url="http://dev.null.org/dadaengine/"
license=('custom:BSD')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=('dadaengine-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://dev.null.org/$pkgname/${_pkgname}-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('884cc1c6a8e4f2fb7b05ef772e905b0d')
sha1sums=('96224f0ccc5de518c3a584704573a1d7481a1dc0')
sha256sums=('3cce44d75ccc8b38c8c147002c27d31b1f3a0a84c6545b2d793e5036bdee3794')

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver/src"
  sed -i '26s/-lpb/& -lfl/' Makefile.in
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make prefix="$pkgdir/usr" \
       infodir="$pkgdir/usr/share/info" \
       mandir="$pkgdir/usr/share/man" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 doc/dada.ps $pkgdir/usr/share/doc/$pkgname/dada.ps
}

