# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.43.1
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
b2sums=('b7b9a534cc9b19e4625287b5cf01e016f32f6919279b87dbf76664aacfae516b473f202277ce5f74f5ea9ba3f574c0717ec2db81564979c56a883cf21a10300d')

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
