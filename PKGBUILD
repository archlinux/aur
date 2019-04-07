# Maintainer: agentcobra <agentcobra@free.fr>
# Contributor: Nover <novares.x@gmail.com>

# Creator Blade <contact@blade-group.com>

# Made with https://github.com/NicolasGuilloux/blade-shadow-beta
_commit=9add3366d25530d51d168608c54b5339b64d2a4e
pkgname=shadow-beta
pkgver=4.1.17
pkgrel=1
pkgdesc="Shadow launcher"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
depends=('desktop-file-utils' 'freetype2' 'libuv' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libappindicator' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu' 'libxss' 'libsndio-61-compat')
provides=(shadow-beta)
source=('https://shadow.tech/linux/shadow-beta.zip')
md5sums=('cd15030c5b51a04e85ee1a4aa477323b')
install=$pkgname.install

# Build the package
package() {
    ### Create working folder
    mkdir shadow

    ### Extract zip file
    bsdtar -x -f shadow-beta.zip -C shadow

	### Extract the deb
	ar xv shadow/Shadow*.deb

	### Extract the data
	bsdtar xf data.tar.xz

	chmod -R g-w usr
	mv usr "${pkgdir}"

	chmod -R g-w opt
	mv opt "${pkgdir}"

	# Move the source directory
	cd "$srcdir"

	### Edit launcher
	sed -e 's/^Categories=.*$/Categories=Games;Game;Utility;Virtualization/g' "${pkgdir}/usr/share/applications/shadow-preprod.desktop" > shadow-beta.desktop
	chmod g-w shadow-beta.desktop

	rm "${pkgdir}/usr/share/applications/shadow-preprod.desktop"
	mv shadow-beta.desktop "${pkgdir}/usr/share/applications/shadow-beta.desktop"
}
