# Maintainer: brent s. <bts[at]square-r00t[dot]net>
#validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chromedriver-dev
pkgver=90.0.4412.3_855346
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome-dev, a.k.a. Canary)"
arch=( 'x86_64' )
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
depends=('google-chrome-dev')
_pkgname=chromedriver
conflicts=('chromium-dev')
install=
changelog=
noextract=()
# TODO: switch this with a bash variable expansion
_pkgver=$(echo ${pkgver} | cut -f2 -d"_")
#source=("${_pkgname}-${pkgver}_linux64.zip::https://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip"
#source=("https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/${_pkgver}/${_pkgname}_linux64.zip")
source=("chromedriver_linux64.zip::https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F${_pkgver}%2F${_pkgname}_linux64.zip?generation=1613675414795893&alt=media")
#        "${_pkgname}-${pkgver}_linux64.zip.sig")
#        "${_pkgname}_linux64.zip.sig")
sha512sums=('SKIP')

pkgver() {
	cur_ver=$(echo ${pkgver} | cut -f1 -d"_")
	# This is just... the dumbest thing.
	# But it's what Google wants. Aparently.
	# https://sites.google.com/a/chromium.org/chromedriver/chromedriver-canary
	_pkgver=$(curl -sL "https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2FLAST_CHANGE?generation=1613675422448818&alt=media")
        echo "${cur_ver}_${_pkgver}"
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m 755 "${srcdir}/${_pkgname}_linux64/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
