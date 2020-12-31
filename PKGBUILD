# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.32.0
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
b2sums=('d72b9b3ca38461cf77851ea03586e4708afead2deceefc41ee4c505aca5678dc51dc8aaa75d9b9f3f021033664b476a8620ad26e80dfafea667916bfe2a1a7bf')

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
