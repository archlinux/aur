pkgbase=sofia-woodwinds-bin
pkgname=("sofia-woodwinds-standalone-bin" "sofia-woodwinds-vst-bin")
pkgver=1.1.1
pkgrel=5
arch=('x86_64')
license=('EULA')
url="https://librewave.com/product/sofia-woodwinds/"
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
source=("Sofia Woodwinds.desktop")
sha256sums=('3cddd06a2e1d9f90254f0d2ffe73a009ba1dd3d871114cf418234c51a26bcdd4')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/Sofia Woodwinds ${pkgver}.sh" "${srcdir}/Sofia Woodwinds ${pkgver}.sh"
	sh "${srcdir}/Sofia Woodwinds ${pkgver}.sh" --tar xvf
}

package_sofia-woodwinds-standalone-bin() {
	pkgdesc="Sofia Woodwinds (Standalone)"
	groups=('pro-audio')
	install -Dm755 "${srcdir}/Sofia Woodwinds" "${pkgdir}/usr/bin/Sofia Woodwinds"
	install -Dm644 "${srcdir}/Sofia Woodwinds.desktop" "${pkgdir}/usr/share/applications/Sofia Woodwinds.desktop"
}

package_sofia-woodwinds-vst-bin() {
	pkgdesc="Sofia Woodwinds (VST)"
	groups=('pro-audio' 'vst-plugins')
	conflicts=('sofia-woodwinds-vst')
	replaces=('sofia-woodwinds-vst')
	install -Dm755 "${srcdir}/Sofia Woodwinds.so" "${pkgdir}/usr/lib/vst/Sofia Woodwinds.so"
}
