# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.45.1
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
b2sums=('ec4d78510828da73a5677b2eaaf853ec3aca9844ef77360e773ebd3185d50d7c0e5fd245a1bdf3f0a5902cb080048387e4f9562f91b74599166c2f48b90b7065')

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
