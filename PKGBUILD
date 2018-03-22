# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Sebastian Stenzel <sebastian.stenzel@gmail.com>

pkgname=cryptomator
pkgver=1.3.3
pkgrel=1
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=("any")
url="https://cryptomator.org/"
license=('GPL3')
depends=('java-runtime=8' 'java-openjfx')
makedepends=('java-runtime-openjdk=8' 'apache-ant')
source=("antkit-${pkgver}.tar.gz::https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/antkit.tar.gz"
        'cryptomator.sh'
        'cryptomator.desktop'
        'cryptomator-vault.xml'
        'logback.xml')
sha256sums=('e00384095f30a813ec5b9c65ac5b873270cfc988bcb66eae4be252fb79daeca1'
            '544b707a5e5d5d2f7694b6044f9bedc8a4bb7a783bc427d6c46bf7d3a22eaa1f'
            '1193f85b545298f6d474c7f17865433f25c73995b00894e0d7d7bc873c696464'
            '78537ead26dcc1488d7fff02f47fce559f70f9bb2d7fa7fa1741ad3cd151bfad'
            '913c7995d51f305c36a81cda9cbce96c9481a04516ccc57024f33590e1c822ea')

build() {
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre/
  ant create-jar
}

package() {
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 "${srcdir}"/libs/*.jar "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 "${srcdir}/antbuild/Cryptomator-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/cryptomator.jar"
  install -Dm755 "${srcdir}/cryptomator.sh" "${pkgdir}/usr/bin/cryptomator"
  install -Dm644 "${srcdir}/package/linux/Cryptomator.png" "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 "${srcdir}/cryptomator-vault.xml" "${pkgdir}/usr/share/mime/packages/cryptomator-vault.xml"
  install -Dm644 "${srcdir}/cryptomator.desktop" "${pkgdir}/usr/share/applications/cryptomator.desktop"
  install -Dm644 "${srcdir}/logback.xml" "${pkgdir}/etc/${pkgname}/logback.xml"
}
