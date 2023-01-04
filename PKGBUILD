# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Andrew Stubbs <andrew dot stubbs at gmail dot com>

pkgname=etcher-bin
pkgver=1.13.1
pkgrel=1
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily"
arch=("x86_64")
url="https://www.balena.io/etcher/"
license=("apache")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'avahi' 'cairo' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'graphite' 'gtk3' 'harfbuzz' 'libcups' 'libdatrie' 'libepoxy' 'libpng' 'libthai' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'pango' 'pixman' 'wayland')
makedepends=('bzip2')
optdepends=("libnotify: for notifications"
            "speech-dispatcher: for text-to-speech")
source=("https://github.com/balena-io/${pkgname%-bin}/releases/download/v${pkgver}/balena-${pkgname%-bin}_${pkgver}_amd64.deb"
	    "etcher")

options=("!strip")
sha256sums=("f030c58fd58652d80fb4f97d002b5a3c17dbb068289578924b44caec7168adbb"
            "612350b1453ec309318ec622fc9d34d83593b01436e62384795664be205bba81")

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.bz2" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
  install -Dm755 "${srcdir}"/etcher "${pkgdir}"/usr/bin/etcher
}
