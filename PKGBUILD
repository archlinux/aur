# Maintainer: Rene Benner <renebenner + arch at gmail dot com>
# Maintainer: Troy Engel <troyengel + arch at gmail dot com>
# Contributor: Callum Denby <me@callumdenby.com>

pkgname=aws-session-manager-plugin
pkgver=1.2.30.0
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
sha512sums_i686=('a8ae6d87c9480ddf823e3d69ac63bb5b903faff059560251508963989a5d74d0110c786757c314dd5a0c2f79064b10372ea5c81d9df30abe8f818f22e8208119')
sha512sums_x86_64=('a8ae6d87c9480ddf823e3d69ac63bb5b903faff059560251508963989a5d74d0110c786757c314dd5a0c2f79064b10372ea5c81d9df30abe8f818f22e8208119')

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
