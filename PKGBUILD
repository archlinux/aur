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
sha512sums_i686=('b581e68546f102df1b196feeb852f5029495c8c5671efa4493b0ede4b7acb5daa6ded4fd632dfe5d17c2439e20c016597ce5ec0d08eb4209ce81f17767b94238')
sha512sums_x86_64=('b581e68546f102df1b196feeb852f5029495c8c5671efa4493b0ede4b7acb5daa6ded4fd632dfe5d17c2439e20c016597ce5ec0d08eb4209ce81f17767b94238')

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
