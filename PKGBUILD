# Contributor: Michael Groh <schnitzelkuchen@googlemail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=fusecompress-git
pkgver=2.1.r146.ged259df
pkgrel=1
epoch=
pkgdesc="Transparent (using fuse) compressing filesystem."
arch=('i686' 'x86_64')
url="http://github.com/tex/fusecompress/"
license=('GPL')
groups=()
depends=('fuse' 'file' 'boost-libs' 'xz' 'lzo2')
makedepends=('git' 'boost')
optdepends=()
checkdepends=()
provides=('fusecompress')
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/tex/fusecompress")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --with-lzma --with-z --with-bz2 --with-lzo2
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

