pkgbase=amp-locker
pkgname=(${pkgbase}-{data,standalone,lv2,vst3}-bin)
pkgver=1.3.5
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/amplocker"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
provides=('amp-locker')
source=('Amp Locker.desktop'
	'Amp Locker Linker'
	'amp-locker.png'
	'https://audioassaultdownloads.s3.amazonaws.com/AmpLocker/AmpLocker109/AmpLockerLinux.zip')
sha256sums=('bbeb596d62ed9943294ee5025ba690def02e263b5c9b3b88304ee84607c52f53'
	'7784d4c4cf7bd953b52c34268cfd92dae1e23028e15c77b8e9e3ebd4970d0e80'
	'2ccb54d693ba09c2f86750891f2d1ea090f74fe282c3268617d1519b58f79ad5'
	'612ab1167dea2537136301b962303378b9a24ce871b29c80555d6d333341876e')

package_amp-locker-data-bin() {
	## Install Asset Data
	pkgdesc="Audio Assault Multiamp Simulator (Data Assets)"
	groups=('pro-audio')

	## Make data assets dir
	mkdir -p "$pkgdir/usr/lib/AmpLockerData"

	## Copy assets to data directory
	cp -r "$srcdir/AmpLockerData/"* "$pkgdir/usr/lib/AmpLockerData"

	## Install Amp Locker Linker Script
	install -Dm755 "$srcdir/Amp Locker Linker" "$pkgdir/usr/bin/Amp Locker Linker"
}

package_amp-locker-lv2-bin() {
	## Install LV2 Plugin
	pkgdesc="Audio Assault Multiamp Simulator (LV2)"
	depends=('amp-locker-data-bin')
	groups=('pro-audio' 'lv2-plugins')
	install -Dm755 "$srcdir/Amp Locker.lv2/Amp Locker.so" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/Amp Locker.so"
	install -Dm644 "$srcdir/Amp Locker.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/dsp.ttl"
	install -Dm644 "$srcdir/Amp Locker.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/manifest.ttl"
	install -Dm644 "$srcdir/Amp Locker.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/ui.ttl"
}

package_amp-locker-vst3-bin() {
	## Install VST3 Plugin
	pkgdesc="Audio Assault Multiamp Simulator (VST3)"
	depends=('amp-locker-data-bin')
	groups=('pro-audio' 'vst3-plugins')
	install -Dm755 "$srcdir/Amp Locker.vst3/Contents/x86_64-linux/Amp Locker.so" "$pkgdir/usr/lib/vst3/Amp Locker.vst3/Contents/x86_64-linux/Amp Locker.so"
}

package_amp-locker-standalone-bin() {
	## Install Standalone Binary
	pkgdesc="Audio Assault Multiamp Simulator (Standalone)"
	depends=('amp-locker-data-bin')
	groups=('pro-audio')
	install -Dm644 "$srcdir/Amp Locker.desktop" "$pkgdir/usr/share/applications/Amp Locker.desktop"
	install -Dm644 "$srcdir/amp-locker.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/amp-locker.png"
	install -Dm755 "$srcdir/Amp Locker Standalone" "$pkgdir/usr/bin/Amp Locker Standalone"
}
