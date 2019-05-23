# Maintainer: Nover <novares.x@gmail.com>
# Contributor: agentcobra <agentcobra@free.fr>

# Creator Blade <contact@blade-group.com>

# Made with https://github.com/NicolasGuilloux/blade-shadow-beta
_commit=9add3366d25530d51d168608c54b5339b64d2a4e
pkgname=shadow-tech
pkgver=4.4.4
pkgrel=1
pkgdesc="Shadow launcher (stable version)"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
depends=('desktop-file-utils' 'freetype2' 'libuv' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libappindicator' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu' 'libxss' 'libsndio-61-compat')
provides=(shadow-tech)
source=('https://update.shadow.tech/launcher/prod/linux/ubuntu_18.04/Shadow.zip')
md5sums=('d12dcdcca21bd154bf472e7b3a4b5e94')
install=$pkgname.install

# Build the package
package() {

	### Create working folder
	mkdir shadow

	### Extract zip file
	bsdtar -x -f Shadow.zip -C shadow

	### Extract the deb
	ar xv shadow/Shadow*.deb

	### Extract the data
	bsdtar xf data.tar.xz

	mv "${srcdir}/usr/share/icons/hicolor/0x0/" "${srcdir}/usr/share/icons/hicolor/1024x1024/"
	mv "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/shadow.png" "${srcdir}/usr/share/icons/shadow.png"

	chmod -R g-w usr
	mv usr "${pkgdir}"

	chmod -R g-w opt
	mv opt "${pkgdir}"

	# Move to shortcut directory
	cd "${pkgdir}/usr/share/applications/"

	sed -i -e 's/^Categories=.*$/Categories=Games;Game;Utility;Virtualization/g' shadow.desktop
	sed -i -e 's/^Icon=.*$/Icon=shadow.png/g' shadow.desktop
	mv shadow.desktop "$srcdir/shadow.desktop"

	# Move the source directory
	cd "$srcdir"

	chmod g-w shadow.desktop
	mv shadow.desktop "${pkgdir}/usr/share/applications/shadow.desktop"
}
