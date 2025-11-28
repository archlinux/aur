# Maintainer: Matthias Mailänder <matthias at mailaender dot name>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

pkgname=openchrom-bin
pkgver=1.5.34
pkgrel=1
pkgdesc="Visualization and analysis of mass spectrometric and chromatographic data"
arch=("x86_64")
url="https://openchrom.net/"
license=('EPL')
provides=(openchrom=$pkgver-$pkgrel)
conflicts=(openchrom)
source=("https://products.lablicate.com/openchrom/${pkgver}/openchrom_linux.x86_64_${pkgver}.tar.gz"
        "openchrom.desktop"
        "openchrom.png")
noextract=("openchrom_linux.x86_64_${pkgver}.tar.gz")
sha256sums=('cd52a5c3d5c3f0339c23aae03c615856248d70c8d7b3616ea95d9bad39d100e4'
            '700aaa0a38757cd12d389598746a375df8e53c133ea7e73c59b5d3f252b336f1'
            '5668c08f75ec9ad00123e857b03502291cea1aaaf69e6641067386e17486ef7f')
depends=('org.freedesktop.secrets' 'webkit2gtk')
options=(!strip)

prepare() {
  mkdir -p "$srcdir/openchrom"
  tar -xzf "openchrom_linux.x86_64_${pkgver}.tar.gz" -C "$srcdir/openchrom"
}

package() {
  install -d "${pkgdir}/usr/lib"
  cp -a "${srcdir}/openchrom" "${pkgdir}/usr/lib/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/openchrom/openchrom" "${pkgdir}/usr/bin/openchrom"

  install -Dm0644 "openchrom.desktop" "${pkgdir}/usr/share/applications/openchrom.desktop"
  install -Dm0644 "openchrom.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openchrom.png"
}
