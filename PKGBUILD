# Maintainer: Jat <chat@jat.email>
# This package generated automatically by https://github.com/jat001/aur-firefox-developer
# Check out https://product-details.mozilla.org/1.0/firefox_versions.json and
# https://travis-ci.org/jat001/aur-firefox-developer before you flag this package is out of date.
# JSON updates always later than download available. Travis might build new packages after a day.
# Please submit a new issue on GitHub if you have any question.

_basename='firefox-developer'
_locale='fy-NL'
_srcurl='https://download-installer.cdn.mozilla.net/pub/devedition/releases'
pkgname="${_basename}-${_locale,,}"
pkgdesc='Firefox Developer Edition is the blazing fast browser that offers cutting edge developer tools and latest features like CSS Grid support and framework debugging - Frisian'
url="https://www.mozilla.org/${_locale}/firefox/developer/"
pkgver='58.0b12'
pkgrel='1'
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=("${_basename}.desktop" 'vendor.js')
source_i686=("${pkgname}_${pkgver}_i686.tar.bz2::${_srcurl}/${pkgver}/linux-i686/${_locale}/firefox-${pkgver}.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.bz2::${_srcurl}/${pkgver}/linux-x86_64/${_locale}/firefox-${pkgver}.tar.bz2")
sha512sums=('ad9d3b7bd3ac4392c40f271741957f5cfa326df45c9dbef9ad014c948eaf28107d64f155a1e9d62c403e63e9a7a98ae826f69d5ce310c7f0a20c5240aae0030f'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
sha512sums_i686=('72c88b1da1501c13b16428362e57b35349c4e9f173fedb6060142e171567265bde0af3304030a8aa19e5c697fe9fa0ca8461fe31addd65ba8e5061d63c17f131')
sha512sums_x86_64=('08b4884b31c02349e7e979d21aab5192f6d61f2ac839506a8c54c8238227e16f8d9ae3366ae2d98770eacd3e21ba56a0aea9cf5d16113ef90e5092d7d3323e76')

provides=("${_basename}")
conflicts=("${_basename}")

depends=('dbus-glib'
         'gtk2'
         'gtk3'
         'libxt'
         'nss')

optdepends=(
	'pulseaudio: audio/video playback'
	'ffmpeg: h.264 video'
	'hunspell: spell checking'
	'hyphen: hyphenation'
)

package() {
	OPT_PATH="opt/${_basename}"
	install -d "$pkgdir"/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -r firefox "$pkgdir/${OPT_PATH}"

	ln -s "/${OPT_PATH}/firefox" "$pkgdir/usr/bin/${_basename}"
	# Icon Stuff
	SRC_LOC="${srcdir}/firefox/browser"
	DEST_LOC="${pkgdir}/usr/share/icons/hicolor"
	for i in 16 32 48
	do
		install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}/${i}x${i}/apps/${_basename}.png"
	done
	install -m644 "$srcdir/firefox/browser/icons/mozicon128.png" "$pkgdir/usr/share/pixmaps/${_basename}-icon.png"

	install -m644 "$srcdir/${_basename}.desktop" "$pkgdir/usr/share/applications/"
	install -Dm644 "$srcdir/vendor.js" "$pkgdir/opt/${_basename}/browser/defaults/preferences/vendor.js"
	# Use system-provided dictionaries
	rm -rf "${pkgdir}/${OPT_PATH}/"{dictionaries,hyphenation}
	ln -sf /usr/share/hunspell "${pkgdir}/${OPT_PATH}/dictionaries"
	ln -sf /usr/share/hyphen "${pkgdir}/${OPT_PATH}/hyphenation"
}
