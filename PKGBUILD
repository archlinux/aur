# Maintainer: aksr <aksr at t-com dot me>
pkgname=gxe
pkgver=1.29
pkgrel=2
epoch=
pkgdesc="Hybrid Editor XE, for working on both main-frame (SPF editor) and PC."
arch=('i686' 'x86_64')
url="http://www.geocities.jp/sakachin2/index.htm"
license=('GPL')
groups=()
depends=('libgnomeui')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.geocities.jp/sakachin2/$pkgname-${pkgver}.tar.gz")
noextract=()
md5sums=('6eb7e0dc8bf0f974989b9d47f01f032d')
sha1sums=('9f81dc7ff35b468f7551fb52d12dc89740c2d0b3')
sha256sums=('8e3d4164f5ae9bc9faa9ba1e0c7cc41a6e751f0f6e867569df4e13eebbe19c80')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '6127s@ncursesw/@@' configure
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/doc/gxe/{en,ja}
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/en/* $pkgdir/usr/share/doc/$pkgname/en/
  install -Dm644 $srcdir/$pkgname-$pkgver/doc/ja/* $pkgdir/usr/share/doc/$pkgname/ja/
}

