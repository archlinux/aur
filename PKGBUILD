# Maintainer: Emile Boutet-Livoff <emilelivoff@gmail.com>

pkgname=lix-ereader
pkgver=1.0.15
pkgrel=1
pkgdesc="A proprietary e-reader"
arch=('x86_64')
url='https://www.lix.com/'
license=('unknown')
#Might depend on libappindicator-gtk2, gconf, libindicator-gtk2, libnotify
#It has it's own libnode.so and libffmpeg.so
depends=('alsa-lib' 'libxss' 'gconf' 'gtk2' 'nss' 'libxtst')
source=("https://download.lix.com/linux/latest")
md5sums=("2df5cc1ecc8830edd941032e6e4b53b0")

prepare() {
	cd "${srcdir}"

	# Remove libraries, they are dependencies
	rm -r usr/lib

	# Desktop Entry
	mkdir -p usr/share/applications
	mv lix.desktop usr/share/applications

	# Move the main chunk of it into opt
	mkdir -p opt/lix
	mv usr/bin/* opt/lix

	# Add a symlink for the executable
	ln -s /opt/lix/lix usr/bin/lix

	# Make the usr/share/icons have the world executable bit set
	chmod -R a+xr usr/share/icons
}

package() {
	cd "${srcdir}"
	cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
}