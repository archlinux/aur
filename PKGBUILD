# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_appname_=netbeans
pkgname=${_appname_}-javase
pkgver=8.1
_pkgbuild_=201510222201
pkgrel=1
pkgdesc="Oracle's Java (SE) IDE"
arch=("any")
url="http://netbeans.org"
license=("CDDL")
depends=("java-environment" "ttf-font" "libxtst" "giflib" "atk")
provides=("${_appname_}")
conflicts=("${_appname_}")
install=${pkgname}.install
options=(!strip)
source=(http://download.${_appname_}.org/${_appname_}/${pkgver}/final/zip/${_appname_}-${pkgver}-${_pkgbuild_}-javase.zip ${_appname_}.desktop)

prepare() {
	cd "${srcdir}"

	# Config
	sed -i "s|#netbeans_jdkhome=\"/path/to/jdk\"|netbeans_jdkhome=\"/usr/lib/jvm/default\"|g" ${_appname_}/etc/${_appname_}.conf
}

package() {
	cd "${srcdir}"

	# Removals
	rm ${_appname_}/bin/${_appname_}.exe

	# Directories
	install -d "${pkgdir}"/usr/share/${_appname_} "${pkgdir}"/usr/bin

	# Files
	cp -r ${_appname_}/* "${pkgdir}"/usr/share/${_appname_}/
	ln -s /usr/share/${_appname_}/bin/${_appname_} "${pkgdir}"/usr/bin/${_appname_}

	# Desktop
	install -D -m644 "${startdir}"/${_appname_}.desktop "${pkgdir}"/usr/share/applications/${_appname_}.desktop
}

sha1sums=('2f9b5537788e141d629e04a6b968ea33d7f0d8ee'
          '88c86c3d8c3349ac3b3822166b4d22b792e54bb8')
