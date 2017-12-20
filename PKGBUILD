# Maintainer: Jat <chat@jat.email>
# This package generated automatically by https://github.com/jat001/aur-firefox-developer
# Check out https://product-details.mozilla.org/1.0/firefox_versions.json and
# https://travis-ci.org/jat001/aur-firefox-developer before you flag this package is out of date.
# JSON updates always later than download available. Travis might build new packages after a day.
# Please submit a new issue on GitHub if you have any question.

_basename='firefox-developer'
_locale='ro'
_srcurl='https://download-installer.cdn.mozilla.net/pub/devedition/releases'
pkgname="${_basename}-${_locale,,}"
pkgdesc='Firefox Developer Edition is the blazing fast browser that offers cutting edge developer tools and latest features like CSS Grid support and framework debugging - Romanian'
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
sha512sums_i686=('251172b43067b5871baf8782b57827d4b6e63167e1704aa026be1289ff2dea007fb42e3c5deef8eaab309fffc6c099ea29d1803326d5d9177e4b3a67560ea020')
sha512sums_x86_64=('a95394c5b895b42441c2656dd094eea87e19952ca3e3e92de8ed26387d5de4f3d0de44898428407ba9ee37ff96a270dd45ceea6ed10c3f69c61b91cf046167c0')

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
