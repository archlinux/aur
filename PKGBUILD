# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui
pkgver=1.5.2
pkgrel=1
pkgdesc='A standalone graphical utility that displays Java source codes of .class files'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-runtime')
makedepends=('java-environment=8')
provides=('jd-gui')
conflicts=('jd-gui-bin')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/java-decompiler/jd-gui/archive/v$pkgver.tar.gz"
  "jd-gui"
  "jd-gui.desktop"
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ ./gradlew --no-daemon build --stacktrace
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build/libs"
  install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/jd-gui" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/jd-gui.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644  "$srcdir/$pkgname-$pkgver/src/linux/resources/jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

sha512sums=('236596d9d05adfd64fa8211ddf6cbd58d2232f51433ec8a7431d306e2acbe364402c7a9117d62f5fb8eae9fa530da343e6fe5aed253ab0a18dfd7e5d0ab88cf6'
            'd073054480e06c9f124605bdbc5cee775e067115592f46bbcea2650d363b81f453b8e1a5e818a685eff7ba166631ebc79d14dc72e2d1dfae102f4cdf05188933'
            '9ddb8521c1791f5d3251f012e30b7d6aaa48b509e02af628f3b8a90fb6ba176de3f79fbfbec316c86c1594ac142ca4d85bcffff7ea8f0fba6f926ea78cd1f81d')
