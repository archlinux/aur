# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Oscar Rainford <oscar@fourbs.com.au>

pkgname=openwebstart-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="An open source reimplementation of the Java Web Start technology."
arch=("x86_64")
url="https://openwebstart.com/"
license=("GPL2")
depends=("java-runtime<18" "xdg-utils")
provides=("openwebstart")
conflicts=("icedtea-web")
install="openwebstart.install"
source=(
  "${pkgname}.deb::https://github.com/karakun/OpenWebStart/releases/download/v${pkgver}/OpenWebStart_linux_${pkgver//./_}.deb"
  "jnlp.xml"
  "javaws.desktop"
  "itw-settings.desktop"
)
sha256sums=(
  "e531b2fc040a9a71d7e3bf9eec2d147c9ed18c4d1fb7e5ef22fe46fec0a6b0a3"
  "e8a2f8208cbfb350a0277102a71fb314da29203e60bf1a48122f3a06635da2f8"
  "b7c75989d4b7cb8468956eebfcbe09ee1cc9e44d536ae5e4d27dddef95dfc9a5"
  "3d7f40d37b54fe4257cf5e6f508ea90c439f54d646602982dd50d1ba7cde0835"
)

build() {
  cd "${srcdir}"

  bsdtar -xf data.tar.gz -C .
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/mime/packages/"
  install -d "${pkgdir}/opt/"

  cp -r "${srcdir}/opt/"* "${pkgdir}/opt"

  ln -sf "/opt/OpenWebStart/itw-settings" "${pkgdir}/usr/bin/"
  ln -sf "/opt/OpenWebStart/javaws" "${pkgdir}/usr/bin/"

  install -Dm644 "${srcdir}/jnlp.xml" "${pkgdir}/usr/share/mime/packages"
  install -Dm644 "${srcdir}/javaws.desktop" "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/itw-settings.desktop" "${pkgdir}/usr/share/applications"
}


