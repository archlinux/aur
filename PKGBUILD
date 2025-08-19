# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=2.4.1
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python')
makedepends=()
arch=('any')
sha256sums=('b7affec68db490d1e215eb17ccbddcc9804bcf8d8ffe129995a65e3f5d3a241d')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="${pkgname}-${pkgver}"

package() {
	depends+=('python-gobject' 'python-cairo' 'python-paramiko' 'python-cryptography' 'python-secretstorage' 'python-matplotlib')

	cd "${_srcdir}"

	local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

	# Install the main executable (runner)
	install -D -m 755 'run.py' "${pkgdir}/usr/bin/sshpilot"
	# Install resources into site-packages so app can import
	install -d "${pkgdir}${site_packages}/sshpilot"
	cp -a 'sshpilot'/*.py "${pkgdir}${site_packages}/sshpilot/"
	install -d "${pkgdir}${site_packages}/sshpilot/resources" "${pkgdir}${site_packages}/sshpilot/ui"
	cp -a 'sshpilot/resources'/* "${pkgdir}${site_packages}/sshpilot/resources/"
	cp -a 'sshpilot/ui'/* "${pkgdir}${site_packages}/sshpilot/ui/"
	# Install desktop file and icon
	install -D -m 644 'io.github.mfat.sshpilot.desktop' "${pkgdir}/usr/share/applications/io.github.mfat.sshpilot.desktop"
	install -D -m 644 'sshpilot/io.github.mfat.sshpilot.svg' "${pkgdir}/usr/share/pixmaps/io.github.mfat.sshpilot.png"
}
