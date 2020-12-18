# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.30.0
pkgrel=1
pkgdesc="Sass makes CSS fun again (canonical implementation)"
arch=(x86_64)
url="http://sass-lang.com/"
license=('MIT')
makedepends=("dart>=2.6.0")
options=(!strip)
provides=('sass')
conflicts=('ruby-sass')
source=("https://github.com/sass/$pkgname/archive/$pkgver.tar.gz")
b2sums=('359f72538f202aa0c97633e28bbc75fc68b942f08654ad2297072d1d7bf517a73f2951b726354ea235fc206158f5e763437f1be292dabf81d9938d2186aee062')

build() {
  cd "$pkgname-$pkgver"
  pub get
  /opt/dart-sdk/bin/dart2native bin/sass.dart -Dversion=$pkgver -o sass
}

package() {
  cd "$pkgname-$pkgver"
  pwd
  echo build/sass
  install -D -m755 sass "$pkgdir/usr/bin/sass"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
