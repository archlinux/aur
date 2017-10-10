# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-nno
pkgver=0.9.0
pkgrel=1
pkgdesc="Apertium language data for Norwegian Nynorsk"
url="http://wiki.apertium.org/wiki/Norwegian_Nynorsk_and_Norwegian_Bokmål"
license=('GPL')
makedepends=('pkgconfig')
depends=('apertium>=3.4.2' 'vislcg3>=0.9.7.6010')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz"
       "cg.patch")
md5sums=('a08ffa162285d8eff02562ed3e3d3be5'
         '6e20ed29209fa10bdf94dea91a78e278')
sha256sums=('a5d8087828ec0fcec41bb497e20fe71fd73c83db5da1bf9eee1aff2ff5bf46f2'
            'c9b243d7b1a8af2e75b02c98fce6b1f53f11bb35a07190119158e959e99a96cd')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../cg.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
