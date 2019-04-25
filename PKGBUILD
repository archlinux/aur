# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>

pkgname=swarp
pkgver=0.1
pkgrel=4
pkgdesc="Simple pointer warp"
license=('MIT')
arch=(x86_64)
url="https://tools.suckless.org/x/swarp/"
depends=(glibc libx11)
source=(http://dl.suckless.org/tools/swarp-$pkgver.tar.gz
	config.mk)
sha512sums=('c44fee2e01cfdd8f02f29bfb917a82f05459c9d5db2a0eb18a9c75f60aa73547f7f6cd32557fd4cf94963e2e30a5f02806925e42a57d6eaaff41daf1866fd09d'
            'cde162bd97d2dc7e1a4e5d9b8b2b85dd1d3401f937e86b4d0b277931515429606a23fd1f0ba5adbe364660985e20050afed00b6c92d650faa744ede4bae57998')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cp "$srcdir"/config.mk .
  sed -i "s/%VERSION%/$pkgver/g" config.mk
  sed -i "s/%CFLAGS%/$CFLAGS/g" config.mk
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
