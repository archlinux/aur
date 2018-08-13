# Maintainer: Tim Dorohin <tim.dorohin@gmail.com>
pkgname=quollwriter
pkgver=2.6.14
pkgrel=3
pkgdesc="A writing application that lets you focus on your words"
arch=('any')
url="http://quollwriter.com/"
license=('Apache')
groups=()
depends=('java-runtime=8' 'java-openjfx')
makedepends=('java-environment-openjdk=8' 'apache-ant')

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/garybentley/quollwriter/archive/v${pkgver}.tar.gz 
'quollwriter.desktop' 
'quollwriter.sh')
noextract=()
md5sums=('bc02ff27304c20ecaaf81f9fef3f7718'
         '62dde2a6d4a8598d68be19ddddc5f1f1'
         'a38ece6df108ea2c01d2bbead42ec69d')

build() {
  cd "$pkgname-$pkgver"

  ant init createJar createPromptsJar createDataJar createImagesJar
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/java/${pkgname}/libs/docx4j"

  install -Dm755 bin/*.jar "${pkgdir}/usr/share/java/${pkgname}/"

  install -Dm755 3rd-party-jars/*.jar "${pkgdir}/usr/share/java/${pkgname}/libs/"

  install -Dm755 3rd-party-jars/docx4j/*.jar "${pkgdir}/usr/share/java/${pkgname}/libs/docx4j/"

  install -Dm644 imgs/window-icon-v3.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/quollwriter.png"

  cd "$srcdir"

  install -Dm644 quollwriter.desktop "${pkgdir}/usr/share/applications/quollwriter.desktop"

  install -Dm755 quollwriter.sh "${pkgdir}/usr/bin/quollwriter"
}
