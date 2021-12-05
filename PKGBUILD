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
b2sums=('1c1a182191e47ed4f372f2eb744d97557eebbaff82b92dcfac6d1d36e0d602ad5198ebb59686d83fccf04355ef357ac59974a5c36f068f91d5f704027c3a8686')

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
