# Contributor: zenekron <zenekron@gmail.com>

pkgname=gradle-language-server
pkgver=3.16.4
pkgrel=1
pkgdesc="Microsoft's Gradle language server"
url="https://github.com/microsoft/vscode-gradle"
arch=("any")
license=('MIT')
makedepends=(java-environment)
depends=(java-runtime)
source=("git+${url}#tag=${pkgver}")
b2sums=('1dafabf901b53153616a49fdaf519e86fd4059acf5d13e40729b2fa2ffaac55b292429fbda38ab35c235d8dd64d73c126be0196f1ccab55031d4067ca2dfc909')

build() {
  cd vscode-gradle
  ./gradlew gradle-language-server:installDist
}

package() {
  cd vscode-gradle
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/java"
  cp -r gradle-language-server/build/install/gradle-language-server "${pkgdir}/usr/share/java"
  ln -s /usr/share/java/gradle-language-server/bin/gradle-language-server "${pkgdir}/usr/bin/gradle-language-server"
}
