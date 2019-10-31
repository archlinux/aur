# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.23.2
pkgrel=1
pkgdesc="Sass makes CSS fun again (canonical implementation)"
arch=(x86_64)
url="http://sass-lang.com/"
license=('MIT')
depends=(dart)
provides=('sass')
conflicts=('ruby-sass')
source=("https://github.com/sass/$pkgname/archive/$pkgver.tar.gz" "sass.sh")
sha256sums=('053c5c0f5d0ebe3b7e05a77012fd02fde8811febe20cbae02d877ab9d3acdfdf'
            '33c9cea95e4a4d03eb184f7f18ef817e31eb6b136bdf4e7aed49f1ea51b1a431')

build() {
  cd "$pkgname-$pkgver"
  pub get
  pub run grinder native-executable
}

package() {
  install -D -m755 sass.sh "$pkgdir/usr/bin/sass"
  cd "$pkgname-$pkgver"
  install -D -m644 build/sass.dart.native "$pkgdir/usr/lib/sass/app.snapshot"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
