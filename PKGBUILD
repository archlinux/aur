# Maintainer: Drew Noel <dnoel@gdssecurity.com>
pkgname=ysoserial-git
pkgrel=1
pkgver=0.0.5.r45.gff59523
pkgdesc="Tool to generate payloads that exploit unsafe Java object deserialization"
arch=("any")
license=('MIT')
depends=("java-environment")
makedepends=("maven")
provides=("ysoserial")
source=("git://github.com/frohoff/ysoserial.git" "ysoserial.command")
md5sums=('SKIP'
         'd9fb33a927b0ee7864b80257ab6a2269')

pkgver() {
  cd "ysoserial"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "ysoserial"
    mvn clean package -DskipTests -DoutputDirectory="ysoserial/maven"
}

package() {
    install -Dm644 ysoserial/target/ysoserial-0.0.6-SNAPSHOT-all.jar "$pkgdir/usr/share/java/ysoserial.jar"
    install -Dm755 ysoserial.command "$pkgdir/usr/bin/ysoserial"
}
