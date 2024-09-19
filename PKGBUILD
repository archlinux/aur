# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-webfai-creator-bin
_pkgname=tuxedo-webfai-creator
pkgver=2.0.0+f8baa6c0
pkgrel=1
pkgdesc="TUXEDO WebFAI Creator is the easiest way to prepare an USB pendrive for TUXEDO’s own Fully Automated Installation (WebFAI)"
arch=(x86_64)
url="https://tuxedocomputers.com"
license=('apache')
options=(!strip !debug)
conflicts=('tuxedo-webfai-creator')

depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'avahi' 'cairo' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'graphite' 'gtk3' 'harfbuzz' 'libcups' 'libdatrie' 'libepoxy' 'libpng' 'libthai' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'pango' 'pixman' 'wayland')
makedepends=('bzip2')

source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb)
sha256sums=('cc12149232874cdf031f85e919c0baf30997f79056b341aa2bbdd618c4fd36d6')
sha512sums=('33a84812b89dc5fa0d077f4342769b26d2077b1548878f8789319a4579565178772a15b80519233ded2f6e3681e00bb2b6bf5ef83b38ed10edfbd41eee8b9c5e')

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.bz2" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
  install -Dm755 "${srcdir}"/output/opt/tuxedo-webfai-creator/tuxedo-webfai-creator "${pkgdir}"/usr/bin/tuxedo-webfai-creator
  install -Dm644 "${srcdir}/output/usr/share/applications/tuxedo-webfai-creator.desktop" "${pkgdir}/usr/share/applications/tuxedo-webfai-creator.desktop"
}
