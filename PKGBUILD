# Maintainer: agentcobra <agentcobra@free.fr>
# Contributor: Nover <novares.x@gmail.com>

# Creator Blade <contact@blade-group.com>

# Made with https://github.com/NicolasGuilloux/blade-shadow-beta
_commit=9add3366d25530d51d168608c54b5339b64d2a4e
pkgname=shadow-beta
pkgver=4.4.39
pkgrel=1
pkgdesc="Shadow launcher"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
depends=('desktop-file-utils' 'freetype2' 'libuv' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libappindicator' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu' 'libxss' 'libsndio-61-compat')
provides=(shadow-beta)
source=('https://update.shadow.tech/launcher/preprod/linux/ubuntu_18.04/ShadowBeta.zip')
md5sums=('2a2168cd02e00ec60dadeb56afbd6afe')
install=$pkgname.install

# Build the package
package() {

	### Create working folder
	mkdir shadow

	### Extract zip file
	bsdtar -x -f ShadowBeta.zip -C shadow

	### Extract the deb
	ar xv shadow/Shadow*.deb

	### Extract the data
	bsdtar xf data.tar.xz

	mv "${srcdir}/usr/share/icons/hicolor/0x0/" "${srcdir}/usr/share/icons/hicolor/1024x1024/"
	mv "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/shadow-preprod.png" "${srcdir}/usr/share/icons/shadow-beta.png"

	chmod -R g-w usr
	mv usr "${pkgdir}"

	chmod -R g-w opt
	mv opt "${pkgdir}"

	# Move to shortcut directory
	cd "${pkgdir}/usr/share/applications/"

	sed -i -e 's/^Categories=.*$/Categories=Games;Game;Utility;Virtualization/g' shadow-preprod.desktop
	sed -i -e 's/^Icon=.*$/Icon=shadow-beta.png/g' shadow-preprod.desktop
	mv shadow-preprod.desktop "$srcdir/shadow-beta.desktop"

	# Move the source directory
	cd "$srcdir"

	chmod g-w shadow-beta.desktop
	mv shadow-beta.desktop "${pkgdir}/usr/share/applications/shadow-beta.desktop"
}
