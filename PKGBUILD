# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=2.3.1
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python')
makedepends=()
arch=('any')
sha256sums=('d506635dc6c1dda66b5328681e9373d037e76b03f1430ad84b0165626daecb0f')
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
	install -D -m 644 'sshpilot/resources/sshpilot.png' "${pkgdir}/usr/share/pixmaps/io.github.mfat.sshpilot.png"
}
