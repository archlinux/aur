pkgname=enpass-rc-bin
pkgver=5.0.0_RC
pkgrel=7
pkgdesc="A multiplatform password manager - RC version. Based on enpass-bin AUR package by Tadly."
arch=('x86_64')
url="http://enpass.io/"
license=('custom')
depends=('libxss' 'libappindicator-gtk2' 'lsof')
conflicts=('enpass-bin')
install=enpass-bin.install
sha256sums=('d66f9eb79cc0308abe38e4822423f73b50827206b65808e4b6b5acf5e2360c99')

source=(https://s3-us-west-2.amazonaws.com/sinewbetas/Enpass+RC/Enpass_5.0_RC_Linux.zip)

package() {
	# Extract data
        ar -vx ${srcdir}/Enpass_5.0_RC_Linux/Enpass_Package_File/enpass-rc_5.0.0_amd64.deb
	tar xfz ${srcdir}/data.tar.gz -C ${pkgdir}/
	
	# Remove unnecessary files which are included in the .deb
	find ${pkgdir} -name ".DS_Store" -delete
	find ${pkgdir} -name "._.DS_Store" -delete
	find ${pkgdir} -name "._enpass.png" -delete

	# Update permissions to match the default system ones
	chmod 755 ${pkgdir}/opt/
	find ${pkgdir}/usr/ -type d -name "*" -exec chmod 755 {} \;

	# Symlink "runenpass.sh" to "/usr/bin" so it is accessible via terminal
	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/Enpass/bin/runenpass.sh ${pkgdir}/usr/bin/enpass
}
