# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Janghyub Seo <jhyub06 at gmail dot com>

pkgname=zoom-libkime
pkgver=5.8.3
_subver=145
_kimever=2.5.6
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service with libkime"
arch=('x86_64')
license=('custom') #GPL3 for libkime-qt
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'ttf-font' 'libx11' 'libxtst' 'libxcb'
	'libxcomposite' 'libxfixes' 'libxi' 'libxcursor' 'libxkbcommon-x11' 'libxrandr'
	'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'xcb-util-image'
	'xcb-util-keysyms' 'dbus' 'ibus' 'kime')
optdepends=('pulseaudio-alsa: audio via PulseAudio'
	'qt5-webengine: SSO login support'
	'picom: extra compositor needed by some window managers for screen sharing'
	'xcompmgr: extra compositor needed by some window managers for screen sharing')
options=(!strip)
source=("${pkgname}-${pkgver}.${_subver}_orig_x86_64.pkg.tar.xz"::"https://cdn.zoom.us/prod/${pkgver}.${_subver}/zoom_x86_64.pkg.tar.xz"
		"https://github.com/Riey/kime/releases/download/v${_kimever}/libkime-qt-5.12.8.so")
sha512sums=(
    'b987668e0e87678e19f601aa9193650c29de572adeb8c0dbccdfe3c25848414a436a7250dcb8a271755c1858b149f24ebc3f01edc75917cb952319fc24253804'
    'afeeb4fcfde8c70ac445fb420ba97db8258e8027001c6c18fe638b517f83d81744baf9b9727dab92e88f0db9108707c976b82a6f83aae79a00d1b139f081729d')
provides=('zoom')

prepare() {
	sed -i 's/Zoom\.png/Zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
	sed -i 's/StartupWMClass=Zoom/StartupWMClass=zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
}

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
	install -m755 libkime-qt-5.12.8.so "${pkgdir}"/opt/zoom/platforminputcontexts/libkimeplatforminputcontextplugin.so
}
