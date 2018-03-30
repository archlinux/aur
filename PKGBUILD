# Maintainer: Zaotar <zaotarwar@mail.ru>

pkgname=opera-stable
pkgver=52.0.2871.40
pkgrel=1
pkgdesc="Opera is a fast, secure, and easy-to-use web browser. It comes with a built-in ad blocker, battery saver and free VPN."
arch=("x86_64")
url="https://www.opera.com/"
license=("custom:opera")
depends=("gtk3" "alsa-lib" "libnotify" "gconf" "curl" "nss" "libcups" "libxss" "ttf-font" "desktop-file-utils" "shared-mime-info" "hicolor-icon-theme")
optdepends=(
    "opera-ffmpeg-codecs: support for h.264 and other non-free media formats"
    "pepper-flash: flash support"
    "upower: opera battery save"
)
conflicts=("opera")
replaces=("opera")
options=("!strip" "!emptydirs")
install=${pkgname}.install
source=("http://get.geo.opera.com/pub/opera/desktop/${pkgver}/linux/${pkgname}_${pkgver}_amd64.deb")
md5sums=("SKIP")

prepare() {
    tar -xf data.tar.xz
}

package() {
 
	cp -dr --no-preserve=ownership usr "${pkgdir}"/
	# Fix crash of opera sandbox
    chmod 4755 "${pkgdir}"/usr/lib/x86_64-linux-gnu/opera/opera_sandbox
	# Installing Licence and Copyright	
	install -D -m644 "/usr/lib/x86_64-linux-gnu/opera/opera_autoupdate.licenses" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "/usr/share/doc/opera-stable/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	# Make opera-ffmpeg-codecs work with opera-stable
	ln -s /usr/lib/opera/lib_extra "${pkgdir}/usr/lib/x86_64-linux-gnu/opera/lib_extra"
      
}
