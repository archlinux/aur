# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: navigaid <navigaid@gmail.com>

pkgname=android-apktool
pkgver=3.0.1
pkgrel=1
_jdkver=25
pkgdesc="A tool for reengineering Android apk files"
arch=("any")
url="https://github.com/iBotPeaches/Apktool"
license=("Apache-2.0")
depends=("java-runtime")
makedepends=("java-environment=${_jdkver}" "gradle")
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/iBotPeaches/Apktool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5bdb4316f9d9aaf07874901860b1938bdd8f850a76d4e35777f4483beea8a63d')

build() {
  cd "Apktool-${pkgver}"
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  gradle build --no-daemon shadowJar proguard
}

package() {
  cd "Apktool-${pkgver}"
  install -D -m 644 "brut.apktool/apktool-cli/build/libs/apktool-cli.jar" "${pkgdir}/usr/share/${pkgname}/apktool.jar"
  install -D -m 755 "scripts/linux/apktool" "${pkgdir}/usr/share/${pkgname}/apktool"
  install -d -m 755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/apktool" "${pkgdir}/usr/bin/apktool"
}

