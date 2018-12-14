# Maintainer: agentcobra <agentcobra@free.fr>
# Contributor: Nover <novares.x@gmail.com>

# Creator Blade <contact@blade-group.com>

# Made with https://github.com/NicolasGuilloux/blade-shadow-beta
_commit=76fea495eda10a2a7edef93609d176ac141c648e
pkgname=shadow-beta
pkgver=0.8.62
pkgrel=3
pkgdesc="Shadow launcher"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
depends=('desktop-file-utils' 'freetype2' 'libuv' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libappindicator' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu' 'libxss')
provides=(shadow-beta)
source=('https://macosx.update.blade-group.fr/mpl/linux/beta/bionic/shadow-alpha-bionic.zip' 'https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/'${_commit}'/AppImage/wrapper.pl' 'https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/'${_commit}'/AppImage/report.pl')
md5sums=('bb5adca354d043b10bc5aca0a5afb37a'
         'acc9366ee43a7f4300969009b688bb0c'
         '65b5ab84660ceddac9068765243ba432')
install=$pkgname.install

# Build the package
package() {

	### Extract the deb
	ar xv shadowalpha-bionic-*.deb

	### Extract the data
	bsdtar xf data.tar.xz

	chmod -R g-w usr
	mv usr "${pkgdir}"

	chmod -R g-w opt
	mv opt "${pkgdir}"

	# Move the source directory
	cd ../

	### Move the Wrapper
	chmod g-w wrapper.pl
	chmod +x wrapper.pl
	mv wrapper.pl "${pkgdir}/opt/shadowbeta/shadow-wrapper.pl"

	### Move the Report.pl
	chmod g-w report.pl
	chmod +x report.pl
	mv report.pl "${pkgdir}/opt/shadowbeta/report.pl"

	### Edit launcher
	sed -e 's/^Exec=.*$/Exec="\/opt\/shadowbeta\/shadow-wrapper.pl"/g' -e 's/^Categories=.*$/Categories=Games;Utility;Virtualization/g' "${pkgdir}/usr/share/applications/shadow-beta.desktop" > shadow-beta.desktop
	chmod g-w shadow-beta.desktop

	rm "${pkgdir}/usr/share/applications/shadow-beta.desktop"
	mv shadow-beta.desktop "${pkgdir}/usr/share/applications/shadow-beta.desktop"

}
