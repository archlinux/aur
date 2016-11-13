# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Sebastian Stenzel <sebastian.stenzel@gmail.com>

pkgname=cryptomator
pkgver=1.2.2
pkgrel=2
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=("any")
url="https://cryptomator.org/"
license=('MIT/X Consortium License')
depends=('java-runtime=8' 'java-openjfx')
makedepends=('java-runtime-openjdk=8' 'apache-ant')
source=("antkit-${pkgver}.tar.gz::https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/antkit.tar.gz"
        'cryptomator.sh'
        'cryptomator.desktop'
        'cryptomator-vault.xml')
sha256sums=('SKIP'
            'c4c69b9e364469e7f1fa95fa2acaac269fb9ae18a5b9ff606b47511935a58cfc'
            '1193f85b545298f6d474c7f17865433f25c73995b00894e0d7d7bc873c696464'
            '78537ead26dcc1488d7fff02f47fce559f70f9bb2d7fa7fa1741ad3cd151bfad')

build() {
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre/
  ant create-jar
}

package() {
  install -d ${pkgdir}/usr/share/java/${pkgname}
  install -Dm644 ${srcdir}/libs/*.jar ${pkgdir}/usr/share/java/$pkgname
  install -Dm644 ${srcdir}/antbuild/Cryptomator-${pkgver}.jar ${pkgdir}/usr/share/java/$pkgname/cryptomator.jar
  install -Dm755 ${srcdir}/cryptomator.sh ${pkgdir}/usr/bin/cryptomator
  install -Dm644 ${srcdir}/package/linux/Cryptomator.png ${pkgdir}/usr/share/java/${pkgname}
  install -Dm644 ${srcdir}/cryptomator-vault.xml ${pkgdir}/usr/share/mime/packages/cryptomator-vault.xml
  install -Dm644 ${srcdir}/cryptomator.desktop ${pkgdir}/usr/share/applications/cryptomator.desktop
}
