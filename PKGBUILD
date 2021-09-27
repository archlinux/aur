# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.42.1
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
b2sums=('208aab1cfadc2e5bd7552fcf1399e852c15d7e55b2b0d9fa1f3b9144924e616f360e484c2e3bfa83ec4413c9943893c100accaf36414bcb2207ff1ee3a74dfa4')

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
