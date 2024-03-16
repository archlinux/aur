pkgbase=collab3
pkgname=("$pkgbase-standalone-bin" "$pkgbase-vst-bin")
pkgver=1.0.0
pkgrel=3
arch=('x86_64')
license=('EULA')
url="https://github.com/augustofilocamo/superOrgan"
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'krb5' 'libpng' 'libxau' 'libxext' 'libxcb' 'libx11' 'pcre2' 'zlib')
source=("https://github.com/augustofilocamo/superOrgan/releases/download/v${pkgver}/CollaB3-Installer-${pkgver}.sh"
		"collab3.png"
		"CollaB3.desktop")
sha256sums=('9e4c14c53ba17e9871147423016f6644f2ca366c1e8c7062e6f63a36127ed381'
			'8d29d2e7f50f504bd973b9abe0dbfdf4089a56caeecf309aa118d070f02d346b'
			'eca8bea1eed8e14e353761501329dac56981095813b239a71d12d94350a7efda')

prepare() {
	# Extract Package
	sh "${srcdir}/CollaB3-Installer-${pkgver}.sh" --tar xvf
}

package_collab3-standalone-bin() {
	# Standalone App
	groups=('pro-audio')
	pkgdesc="CollaB3 Tone Wheel Organ (Standalone)"
	install -Dm755 "${srcdir}/CollaB3" "${pkgdir}/usr/bin/CollaB3"
	install -Dm644 "${srcdir}/collab3.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/collab3.png"
	install -Dm644 "${srcdir}/CollaB3.desktop" "${pkgdir}/usr/share/applications/CollaB3.desktop"
}

package_collab3-vst-bin() {
	# VST Plugin
	groups=('pro-audio' 'vst-plugins')
	pkgdesc="CollaB3 Tone Wheel Organ (VST)"
	install -Dm755 "${srcdir}/CollaB3.so" "${pkgdir}/usr/lib/vst/CollaB3.so"
}
