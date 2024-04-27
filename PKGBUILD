pkgbase=kazbek-bin
pkgname=("kazbek-standalone-bin" "kazbek-vst-bin")
pkgver=1.0.1
pkgrel=2
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/kazbek/"
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
source=("Kazbek.desktop")
sha256sums=('59a635c1fff56efe9fe79290c8a5f83ac706b2996c33cd9612c2f95426ccdbed')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Kazbek ${pkgver}.sh" "${srcdir}/Kazbek ${pkgver}.sh"
	sh "${srcdir}/Kazbek ${pkgver}.sh" --tar xvf
}

package_kazbek-standalone-bin() {
	pkgdesc="Kazbek Woodwinds (Standalone)"
	groups=('pro-audio')
	install -Dm755 "${srcdir}/Kazbek" "${pkgdir}/usr/bin/Kazbek"
	install -Dm644 "${srcdir}/Kazbek.desktop" "${pkgdir}/usr/share/applications/Kazbek.desktop"
}

package_kazbek-vst-bin() {
	pkgdesc="Kazbek Woodwinds (VST)"
	groups=('pro-audio' 'vst-plugins')
	conflicts=('kazbek-vst')
	replaces=('kazbek-vst')
	install -Dm755 "${srcdir}/Kazbek.so" "${pkgdir}/usr/lib/vst/Kazbek.so"
}
