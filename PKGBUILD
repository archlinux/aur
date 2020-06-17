# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=jmbe
pkgver=1.0.7b
pkgrel=1
pkgdesc="Java Multi-Band Excitation library: Audio conversion library for decoding MBE encoded audio frames."
arch=('i686' 'x86_64')
url="https://github.com/DSheirer/jmbe"
license=('GPLv3')
depends=('jre-openjdk')
makedepends=('jdk-openjdk' 'gradle')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/DSheirer/jmbe/archive/v${pkgver}.tar.gz")
sha256sums=('ff6f322a742f8276464becf829867b4b54da1581a11ee0feaa39253f8ad39870')

_openjdk_ver=$(pacman -Q jre-openjdk |cut -d " " -f2 |cut -d "." -f 1)

build() {
  cd "$pkgname-$pkgver"
  ./gradlew build
}

package() {
  cd "${pkgname}-${pkgver}"
  #install -d ${pkgdir}/opt/sdrtunk/bin
  #install -Dm755 scripts/sdf-trunk ${pkgdir}/opt/sdrtunk/bin/sdr-trunk
  install -Dm644 codec/build/libs/jmbe-${pkgver}.jar "${pkgdir}/usr/lib/jvm/java-${_openjdk_ver}-openjdk/lib/jmbe-${pkgver}.jar"
}
