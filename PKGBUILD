# Maintainer: Steven Seifried <gitlab@canox.net>

pkgname=tuxedo-webfai-creator-bin
_pkgname=tuxedo-webfai-creator
pkgver=2.0.1+52192a09
pkgrel=1
pkgdesc="TUXEDO WebFAI Creator is the easiest way to prepare an USB pendrive for TUXEDO’s own Fully Automated Installation (WebFAI)"
arch=(x86_64)
url="https://tuxedocomputers.com"
license=('apache')
options=(!strip !debug)
conflicts=('tuxedo-webfai-creator')

depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'avahi' 'cairo' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'graphite' 'gtk3' 'harfbuzz' 'libcups' 'libdatrie' 'libepoxy' 'libpng' 'libthai' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'pango' 'pixman' 'wayland' 'ffmpeg' 'icu')
makedepends=('bzip2')

source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb)
sha256sums=('d90af2ad3d42e205770d506a1b8a37f5353899ca0a203ed334fb33a5986ab714')
sha512sums=('723cd90043e77000b91e8c1934149061d83b79bd02af562e3faf203fdc70483b1173d1979f2c6c9c9578f9af5b50a77bb67d95ff3dc7dc5c7354ac0ec5b2167f')

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
