# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.44.0
pkgrel=1
pkgdesc="Sass makes CSS fun again (canonical implementation)"
arch=(x86_64)
url="http://sass-lang.com/"
license=('MIT')
makedepends=("dart>=2.14.0")
options=(!strip)
provides=('sass')
conflicts=('ruby-sass')
source=("https://github.com/sass/$pkgname/archive/$pkgver.tar.gz")
b2sums=('8b02eaab47bddd9466e55edfead40895833eb635616dfd4c30206e6bed12227a6ac2a19521be0a246ba9b8cdd5fd90b5c0f821446ce825f6ddd210fbd39965a1')

build() {
  cd "$pkgname-$pkgver"
  pub get
  dart compile exe -Dversion=$pkgver -o sass bin/sass.dart
}

package() {
  cd "$pkgname-$pkgver"
  pwd
  echo build/sass
  install -D -m755 sass "$pkgdir/usr/bin/sass"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
