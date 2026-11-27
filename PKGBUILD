# Maintainer: Matthias Mailänder <matthias at mailaender dot name>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

pkgname=openchrom-bin
pkgver=1.6.43
pkgrel=1
pkgdesc="Visualization and analysis of mass spectrometric and chromatographic data"
arch=("x86_64")
url="https://openchrom.net/"
license=('EPL-2.0')
provides=(openchrom=$pkgver-$pkgrel)
conflicts=(openchrom)
source=("https://products.lablicate.com/openchrom/${pkgver}/openchrom_linux.x86_64_${pkgver}.tar.gz"
        "openchrom.desktop"
        "openchrom.png")
noextract=("openchrom_linux.x86_64_${pkgver}.tar.gz")
sha256sums=('d11f4734f9f79dec66155b68f27918ed257e66b61a2ddf9c66b2bc2f656d9444'
            '700aaa0a38757cd12d389598746a375df8e53c133ea7e73c59b5d3f252b336f1'
            'df4975ea529a48f3ea31445c060060562ec456aefa7debae6477706588a00466')
depends=('org.freedesktop.secrets' 'webkit2gtk-4.1')
options=(!strip)

prepare() {
  mkdir -p "$srcdir/openchrom"
  tar -xzf "openchrom_linux.x86_64_${pkgver}.tar.gz" -C "$srcdir/openchrom"
}

package() {
  install -d "${pkgdir}/usr/lib"
  cp -a "${srcdir}/openchrom" "${pkgdir}/usr/lib/"
  sed -i 's;-Dopenchrom.update=true;-Dopenchrom.update=false;' "${pkgdir}/usr/lib/openchrom/openchrom.ini"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/openchrom/openchrom" "${pkgdir}/usr/bin/openchrom"

  install -Dm0644 "openchrom.desktop" "${pkgdir}/usr/share/applications/openchrom.desktop"
  install -Dm0644 "openchrom.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openchrom.png"
}
