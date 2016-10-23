# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=zita-dpl1
pkgver=0.1.0
pkgrel=1
pkgdesc="A look-ahead digital peak level limiter"
arch=(i686 x86_64)
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL' 'custom')
depends=('cairo' 'clthreads>=2.4.0' 'clxclient>=3.9' 'jack')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('32e82022c7d9fd996c998877de165594')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"

  make PREFIX=/usr DESTDIR="$pkgdir/" install

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ../doc/* "$pkgdir/usr/share/doc/$pkgname"

  # custom LICENSE
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  head -n21 dplimit1.h > \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 ../LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/NOTE"
}

# vim:set ts=2 sw=2 et:
