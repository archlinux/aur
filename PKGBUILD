# Maintainer: Jeremy Tregunna <jeremy@metismachine.com>
# Maintainer: Wess Cope <wess@metismachine.com>
pkgname=lfe
pkgver=1.3
pkgrel=1
pkgdesc="LISP Flavoured Erlang"
arch=(x86_64)
url="https://github.com/rvirding/lfe"
license=('Apache')
depends=('erlang>=20.3.8')
makedepends=('make>=4.0.0', 'gcc>=8.0.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rvirding/$pkgname/archive/$pkgver.tar.gz")
md5sums=('c57494020a7227978172803277048749')
sha1sums=('f5875799a8e06dca1636c736df79366c384eadb4')
sha256sums=('1946c0df595ae49ac33fe583f359812dec6349da6acf43c1458534de3267036b')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
  cc -o bin/lfeexec c_src/lfeexec.c
	PREFIX=/usr make compile
}

package() {
	cd "$pkgname-$pkgver"
  echo `pwd`
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/lib/$pkgname/bin $pkgdir/usr/lib/$pkgname/ebin $pkgdir/usr/share
  for i in bin/*; do
    install -m755 $i $pkgdir/usr/lib/$pkgname/$i
    ln -sf /usr/lib/$pkgname/$i $pkgdir/usr/$i
  done
  for i in 1 3 7; do
    mkdir -p $pkgdir/usr/share/man/man$i
    install -m644 doc/man/*.$i $pkgdir/usr/share/man/man$i/
  done
  for i in ebin/*; do
    install -m 644 $i $pkgdir/usr/lib/$pkgname/ebin
  done
}
