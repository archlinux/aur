# Maintainer: Rene Benner <renebenner + arch at gmail dot com>
# Maintainer: Troy Engel <troyengel + arch at gmail dot com>
# Contributor: Callum Denby <me@callumdenby.com>

pkgname=aws-session-manager-plugin
pkgver=1.1.61.0
pkgrel=1
pkgdesc="AWS Session Manager Plugin for aws-cli."
arch=('i686' 'x86_64')
url="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
license=('custom')
depends=('aws-cli')
backup=('usr/lib/systemd/system/session-manager-plugin.service' 'usr/sessionmanagerplugin/LICENSE' 'usr/sessionmanagerplugin/seelog.xml' 'usr/sessionmanagerplugin/VERSION')
options=('!strip' '!emptydirs')
source_i686=(https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_32bit/session-manager-plugin.deb)
source_x86_64=(https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_64bit/session-manager-plugin.deb)
sha512sums_i686=('21c7778ece8fadaf3f5510c7af5f90b6bbe1c41eb4d71cae57630c8bda8bba3bc19aabd44e2a0abcb56e18306cc05b060e377f2fb57ef78dcfd17bf1e784ce66')
sha512sums_x86_64=('21c7778ece8fadaf3f5510c7af5f90b6bbe1c41eb4d71cae57630c8bda8bba3bc19aabd44e2a0abcb56e18306cc05b060e377f2fb57ef78dcfd17bf1e784ce66')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"
	mkdir -p usr/bin
	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	rm -rf etc/
	sed -i 's/usr\/local/usr/' usr/lib/systemd/system/session-manager-plugin.service
	mv usr/local/* usr; rm -rf usr/local
	ln -sf /usr/sessionmanagerplugin/bin/session-manager-plugin usr/bin/session-manager-plugin
	cd ..
}
