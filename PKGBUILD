# Maintainer: Robin H. <robin@blckct.io>
pkgname=alfaview
pkgver=9.30.2
pkgrel=1
pkgdesc='High quality audio video conferencing for professional online meetings and live classes'
arch=('x86_64')
url='https://alfaview.com/'
license=('unknown')
# not sure about the deps, copy-pasted from debian package (feedback required)
depends=('ttf-roboto' 'libsecret' 'xdg-utils' 'freetype2' 'fontconfig' 'gst-plugins-good' 'gst-plugins-bad' 'libxfixes' 'alsa-lib' 'libxkbcommon' 'dbus' 'libpulse')
options=('!strip')
provides=("alfaview=${pkgver}")
install="$pkgname.install"
source=("https://assets.alfaview.com/stable/linux/deb/${pkgname}_${pkgver}.deb")
noextract=("${pkgname}_${pkgver}.deb")
sha256sums=('ff21bd5639d8c9efee5d2668550810a71524dc8bcef1467b00c34c67bb483835')

prepare() {
  mkdir -p deb-data
  bsdtar -O -xf "${pkgname}_${pkgver}.deb" data.tar.xz | bsdtar -C ./deb-data -xJf -
}

package() {
  mv deb-data/* "${pkgdir}/"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf /opt/alfaview/alfaview "${pkgdir}/usr/bin/alfaview"
}
