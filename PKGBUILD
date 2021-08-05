# Maintainer: Rene Benner <renebenner + arch at gmail dot com>
# Maintainer: Troy Engel <troyengel + arch at gmail dot com>
# Contributor: Callum Denby <me@callumdenby.com>

pkgname=aws-session-manager-plugin
pkgver=1.2.234.0	
pkgrel=1
pkgdesc="AWS Session Manager Plugin for aws-cli."
arch=('x86_64')
url="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
license=('custom')
depends=('aws-cli')
backup=('usr/lib/systemd/system/session-manager-plugin.service' 'usr/sessionmanagerplugin/LICENSE' 'usr/sessionmanagerplugin/seelog.xml' 'usr/sessionmanagerplugin/VERSION')
options=('!strip' '!emptydirs')
source_x86_64=(https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_64bit/session-manager-plugin.deb)
sha512sums_x86_64=('3b1bae7937333abaa7c5bdd180d8fb14dc943cf2dd671304cccbaafdfbe9d6c5afd7b1acfa52a6cbfaf8d99dd26d501492d287b90c52657e8be0828f573a91ea')

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
