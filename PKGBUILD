# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=zoem
pkgver=11.166
pkgrel=2
pkgdesc='Zoem programming language'
arch=(x86_64)
url='https://micans.org/zoem/'
license=(GPL2)
source=("https://micans.org/zoem/src/$pkgname-${pkgver/./-}.tar.gz")
sha256sums=('1267a222ae2ee998a91dbe66df19cf998a0e7db45c7e59821049ae6b791f37fe')

build() {
  cd "$pkgname-${pkgver/./-}"
  export LDFLAGS="$LDFLAGS -Wl,--allow-multiple-definition"
  export CFLAGS="$CFLAGS -march=x86-64 -std=c11 -w"
  export CXXFLAGS="$CXXFLAGS -march=x86-64 -std=c++14 -w"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-${pkgver/./-}" install DESTDIR="$pkgdir"
}
