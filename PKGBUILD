# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak
pkgver=5.0.0beta65.1
pkgrel=1
pkgdesc="Software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
depends=('alsa-lib'
	'atk'
	'at-spi2-atk'
	'at-spi2-core'
	'avahi'
	'dbus'
	'e2fsprogs'
	'expat'
	'flac'
	'gcc-libs'
	'glib2'
	'glibc'
	'gmp'
	'gnutls'
	'keyutils'
	'krb5'
	'libasyncns'
	'libcap'
	'libcups'
	'libdrm'
	'libffi'
	'libgcrypt'
	'libgpg-error'
	'libidn2'
	'libogg'
	'libp11-kit'
	'libpulse'
	'libsndfile'
	'libtasn1'
	'libunistring'
	'libvorbis'
	'libx11'
	'libxau'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxdmcp'
	'libxext'
	'libxfixes'
	'libxi'
	'libxkbcommon'
	'libxrandr'
	'libxrender'
	'libxshmfence'
	'lz4'
	'mesa'
	'nettle'
	'nspr'
	'nss'
	'opus'
	'pcre'
	'systemd-libs'
	'util-linux-libs'
	'wayland'
	'xz'
	'zlib'
	'zstd')
optdepends=('libpulse')
arch=('x86_64')
source=('teamspeak.desktop'
        'teamspeak.svg'
        "teamspeak-client-$pkgver.tar.xz::http://update.teamspeak.com/linux/x64/latest/0-1632399768.patch")
sha512sums=('57c618d386023d27fcb5f6b7e5ce38fe7012680988aff914eeb6c246d855b190689bbad08d9824c864c1776af322e8df34019234128beb306a09b114673b37c9'
            '3b0c7fe2e71eb207a9874c3fba31c18067867481d81c7a8a2a9fef5956f04cfbd559186f6996e2e3d79292d1aaaae443ab6ea6272d0f6b3205fdd12387de27b0'
            '793a1cc3bcf6241edce2c8a0bf6e3ecc3546e79c69100926942768211ad24b233b68d41ccf2e3472a96081acf574dbcb02123d105d43eff8fddeabf9f02e1b80')
# Following authorization token is hard-coded. It is not bound to any account, but without it you will get 403 Forbidden error from any request to update.teamspeak.com
# The archive starts at offset of 200 bytes
DLAGENTS=("http::/usr/bin/curl --basic -u teamspeak5:LFZ6Z^kvGrnX~an,\$L#4gxL3'a7/a[[&_7>at}A3ARRGY -A teamspeak.downloader/1.0 -C 200 -o %o %u")

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/"
  install -d "${pkgdir}/usr/lib/${pkgname}"

  # Recursively installing all top-level regular files and directories from srcdir
  #   Files supplied to makepkg as sources are present in srcdir using symbolic links
  #   That way we can only copy files extracted from source archives
  find "${srcdir}" -mindepth 1 -maxdepth 1 -type d,f -exec cp -r {} "${pkgdir}/usr/lib/${pkgname}/" \;

  chmod 755 "${pkgdir}/usr/lib/${pkgname}/TeamSpeak"

  install -Dm644 "${srcdir}/teamspeak.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/teamspeak.svg" "${pkgdir}/usr/share/pixmaps/teamspeak.svg"

  ln -s /usr/lib/${pkgname}/licenses "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /usr/lib/${pkgname}/TeamSpeak "${pkgdir}/usr/bin/teamspeak"
}
