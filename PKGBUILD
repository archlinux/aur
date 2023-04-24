# Maintainer: Robin H. <robin@blckct.io>
pkgname=alfaview
pkgver=8.68.1
pkgrel=3
pkgdesc='High quality audio video conferencing for professional online meetings and live classes'
arch=('x86_64')
url='https://alfaview.com/'
license=('unknown')
# not sure about the deps, copy-pasted from debian package (feedback required)
depends=('ttf-roboto' 'libsecret' 'xdg-utils' 'freetype2' 'fontconfig' 'gst-plugins-bad' 'libxfixes' 'alsa-lib' 'libxkbcommon' 'dbus' 'libpulse')
options=('!strip')
conflicts=('alfaview-beta')
provides=("alfaview=${pkgver}")
install="$pkgname.install"
source=("https://assets.alfaview.com/stable/linux/deb/${pkgname}_${pkgver}.deb")
noextract=("${pkgname}_${pkgver}.deb")
sha256sums=('36c8f97843a506300c7231238c5b13ea0c4c032e8598e46c4032b055e745b542')

prepare() {
	mkdir -p deb-data
	bsdtar -O -xf "${pkgname}_${pkgver}.deb" data.tar.xz | bsdtar -C ./deb-data -xJf -
}

package() {
	mv deb-data/* "${pkgdir}/"
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf /opt/alfaview/alfaview "${pkgdir}/usr/bin/alfaview"
}
