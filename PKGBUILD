# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui
pkgver=1.4.0
pkgrel=1
pkgdesc='A standalone graphical utility that displays Java source codes of .class files'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-runtime')
makedepends=('gradle')
provides=('jd-gui')
conflicts=('jd-gui-bin')
source=("https://github.com/java-decompiler/jd-gui/archive/v${pkgver}.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
  gradle -DgradleUserHomeDir=../.gradle build --stacktrace
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build/libs"
  install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$pkgname/$pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}

md5sums=('52b6cbd10bad9a45227046ec9ae5d618')
sha1sums=('649111b4c79282803c4505d4c587537277f09a79')
sha256sums=('5dd1220e7426352d51fa9eadb8a7d9685a6d7d93646c3fabae6f964cbf3edf2a')
sha512sums=('3e2c6224d8252f66fab61f74aaa4199b6fd2a6ad475418e80e1b31fcdf5a4d7fc3f8ce04fa729843e53029e656865f6eac62aa5306518a0770aecc41708f92a6')
