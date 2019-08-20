# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=ephemeral-bin
_appname=ephemeral
_projectname=com.github.cassidyjames.ephemeral
pkgver=5.2.1
_subver=c76aa6
pkgrel=1
pkgdesc="The always-incognito web browser. Browse the Internet in private without leaving a trace of history on your computer."
arch=('x86_64')
url="https://github.com/cassidyjames/ephemeral"
license=('GPL3')
depends=('dconf' 'desktop-file-utils' 'glib2>=2.49.2' 'granite>=5.2.3' 'gtk3>=3.22.29' 'hicolor-icon-theme' 'libdazzle>=3.25.3' 'libgee>=0.8.3' 'libsoup>=2.32.2' 'webkit2gtk>=2.15.4')
install=${pkgname}.install
source=("http://packages.elementary.io/appcenter/pool/main/c/${_projectname}/${_projectname}${pkgver}-${_subver}.deb")
sha512sums=('a229bfd1f81fec9cd03a36d2ed6e4321648c65cc5db48e61de0fa9e00dc0898038159efc4351d31fba4879022971a9e46444ab47c0e92cc97ac15ac199bcb05a')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Rename major files from for better system integration
	mv "${pkgdir}/usr/bin/${_projectname}" "${pkgdir}/usr/bin/${_appname}"
	mv "${pkgdir}/usr/share/applications/${_projectname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
	mv "${pkgdir}/usr/share/doc/${_projectname}" "${pkgdir}/usr/share/doc/${_appname}"

	# Update desktop file to match renamed package binary
	sed -i "s/Exec=${_projectname}/Exec=${_appname}/" "${pkgdir}/usr/share/applications/${_appname}.desktop"

}
