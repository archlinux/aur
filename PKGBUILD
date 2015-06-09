# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=tracy
pkgver=0.07
pkgrel=1
pkgdesc="A system call tracer and injector"
arch=('i686' 'x86_64')
url="http://hetgrotebos.org/wiki/Tracy"
license=('BSD')
optdepends=(python)
source=("https://github.com/MerlijnWajer/tracy/archive/$pkgname-$pkgver.tar.gz"
)
md5sums=('bf2ca7c645ee45d314197b4f29b4ed33')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver/src"
  make
  cd ./soxy
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver/src"
  make tests
}


package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver/src"
  for ext in a so; do
    install -Dm644 lib"$pkgname.$ext" "$pkgdir/usr/lib/lib$pkgname.$ext"
  done
  install -Dm644 tracy.h "$pkgdir"/usr/include/tracy.h
  install -Dm755 soxy/soxy "$pkgdir"/usr/bin/soxy
  mkdir -p $pkgdir/usr/lib/python3.4/site-packages/$pkgname
  install -Dm644 *.py  $pkgdir/usr/lib/python3.4/site-packages/$pkgname/
}

# vim:set ts=2 sw=2 et:
