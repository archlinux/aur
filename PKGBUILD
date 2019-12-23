# Maintainer: Kevin Michael Frick <kmfrick#AT#gmail#DOT#com>
# Thanks to Louis Tim Larsen for the -bin PKGBUILD

pkgname=ephemeral-git
conflicts=('ephemeral-bin')
_appname=ephemeral
_projectname=com.github.cassidyjames.ephemeral
pkgver=git
pkgrel=1
pkgdesc="The always-incognito web browser. Browse the Internet in private without leaving a trace of history on your computer."
arch=('x86_64')
url="https://github.com/cassidyjames/ephemeral"
license=('GPL3')
depends=('dconf' 'desktop-file-utils' 'glib2>=2.49.2' 'granite>=5.2.3' 'gtk3>=3.22.29' 'hicolor-icon-theme' 'libdazzle>=3.25.3' 'libgee>=0.8.3' 'libsoup>=2.32.2' 'webkit2gtk>=2.15.4')
source=("git+https://github.com/cassidyjames/ephemeral")
md5sums=('SKIP')

package(){

	cd "${srcdir}/${_appname}"
	meson build --prefix=/usr
	cd build
	ninja
	DESTDIR="${pkgdir}"	ninja install

	# Rename major files from for better system integration
	mv "${pkgdir}/usr/bin/${_projectname}" "${pkgdir}/usr/bin/${_appname}"
	mv "${pkgdir}/usr/share/applications/${_projectname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	# Update desktop file to match renamed package binary
	sed -i "s/Exec=${_projectname}/Exec=${_appname}/" "${pkgdir}/usr/share/applications/${_appname}.desktop"

}
