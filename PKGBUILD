# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Andrew Stubbs <andrew dot stubbs at gmail dot com>

pkgname=etcher-bin
pkgver=2.1.6
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

sha256sums=('2bdebb46c9f750a9abf11c188ff69a405b4a4fed114333d634c3b3fe59a64057'
            'f6471982ba3c921253a817b78b36ff93e88fc8648836a56cd76d85e3544f49fd')

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.zst" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
  install -Dm755 "${srcdir}"/etcher "${pkgdir}"/usr/bin/etcher
}
