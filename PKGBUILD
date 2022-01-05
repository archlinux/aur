# Maintainer: Rene Benner <renebenner + arch at gmail dot com>
# Maintainer: Troy Engel <troyengel + arch at gmail dot com>
# Contributor: Callum Denby <me@callumdenby.com>

pkgname=aws-session-manager-plugin
pkgver=1.2.279.0
pkgrel=1
pkgdesc="AWS Session Manager Plugin for aws-cli."
arch=('x86_64')
url="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
license=('custom')
depends=('aws-cli')
backup=('usr/lib/systemd/system/session-manager-plugin.service' 'usr/sessionmanagerplugin/LICENSE' 'usr/sessionmanagerplugin/seelog.xml' 'usr/sessionmanagerplugin/VERSION')
options=('!strip' '!emptydirs')
source_x86_64=(https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_64bit/session-manager-plugin.deb)
sha512sums_x86_64=('aa796a7b7512a43d6e4b678832befb6b956e464417a595f5cb581001a26d1493c11688b241959353cc93a6653e7717d23ca247be2941ef15cd211a1e9b73af49')

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
