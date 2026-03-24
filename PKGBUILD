# Maintainer: Marko Korhonen <aur@marko.korhonen.cc>

pkgname=jmbe
pkgver=1.0.9
pkgrel=1
pkgdesc="Java Multi-Band Excitation library: Audio conversion library for decoding MBE encoded audio frames."
arch=('i686' 'x86_64')
url="https://github.com/DSheirer/jmbe"
license=('GPLv3')
depends=('jre17-openjdk')
makedepends=('jdk17-openjdk' 'gradle')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/DSheirer/jmbe/archive/v${pkgver}.tar.gz")
sha256sums=('ed7eff0a31067b3a328f1874157a22c156d4ecb1d9f08ea2bc732f63daf19f61')

_openjdk_ver=$(pacman -Q jre-openjdk |cut -d " " -f2 |cut -d "." -f 1)

build() {
  cd "$pkgname-$pkgver"
  JAVA_HOME=/usr/lib/jvm/java-17-openjdk ./gradlew build
}

package() {
  cd "${pkgname}-${pkgver}"
  #install -d ${pkgdir}/opt/sdrtunk/bin
  #install -Dm755 scripts/sdf-trunk ${pkgdir}/opt/sdrtunk/bin/sdr-trunk
  install -Dm644 codec/build/libs/jmbe-${pkgver}.jar "${pkgdir}/usr/lib/jvm/java-${_openjdk_ver}-openjdk/lib/jmbe-${pkgver}.jar"
}
