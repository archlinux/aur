# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=pixel-sorter
pkgver=4.0.3
_jdkver=11
pkgrel=1
pkgdesc="A command line app for pixel sorting images"
arch=('any')
url="https://github.com/RusticFlare/pixel-sorter"
license=('MIT')
depends=("java-runtime>=${_jdkver}" "bash")
makedepends=("java-environment=${_jdkver}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "${pkgname}")
sha512sums=('c66851227c1d90d507c00d90abc612620c8f5a11c986ebbc7b6b0a8d4bdb3b4ab0f378ec5b96753f405d3f0c98118feb9d7aa3c0482110db52d80894f1ffbe5b'
            '3544e79c29235f395eee05695286b5831a820b23f2fff3ca9f461f5db4e3db39b1a4b38278eed6a19ae73f850522ebd66af87651f32382b447179fd51d914036')

build() {
  cd "$pkgname-$pkgver"
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  ./gradlew assemble
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "build/libs/$pkgname.jar" -t "$pkgdir/usr/share/java"
  install -Dm 755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
