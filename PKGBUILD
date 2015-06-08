pkgname=disunity
pkgver=0.3.4
pkgrel=1
pkgdesc="An experimental toolset for Unity asset and asset bundle files."
arch=("any")
url="https://github.com/ata4/disunity"
license=("public domain")
makedepends=(dos2unix)
depends=(java-runtime)
source=("https://github.com/ata4/disunity/releases/download/v$pkgver/disunity_v$pkgver.zip" "launch.sh")
sha256sums=('5fa7440698cd71616a3521c24ac7eba61003e63806c1fa8cff6d032b1896d5db'
            '5230b932855b541990e0886527b1fd161644671f9fbb6a1e06c471ca027f9f44')

prepare() {
	find . -type f -exec dos2unix {} \;
}

package() {
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/disunity/LICENSE.md"
  install -Dm755 launch.sh "$pkgdir/usr/bin/disunity"
  install -Dm644 disunity.jar "$pkgdir/usr/share/disunity/disunity.jar"
  find lib/ -name '*.jar' -exec install -Dm644 {} "$pkgdir/usr/share/disunity/"{} \;
}
