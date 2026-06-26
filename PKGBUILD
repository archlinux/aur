# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Rene Benner <renebenner + arch at gmail dot com>
# Contributor: Troy Engel <troyengel + arch at gmail dot com>
# Contributor: Callum Denby <me@callumdenby.com>
pkgname=aws-session-manager-plugin
pkgver=1.2.835.0
pkgrel=1
pkgdesc="AWS Session Manager Plugin for aws-cli."
arch=('x86_64' 'aarch64')
url="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
license=('Apache-2.0')
depends=('aws-cli')
backup=('usr/lib/systemd/system/session-manager-plugin.service' 'usr/sessionmanagerplugin/LICENSE' 'usr/sessionmanagerplugin/seelog.xml' 'usr/sessionmanagerplugin/VERSION')
options=('!strip' '!emptydirs')
source_x86_64=("${pkgname}-${pkgver}.deb"::https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_64bit/session-manager-plugin.deb)
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb"::https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_arm64/session-manager-plugin.deb)
sha512sums_x86_64=('971613d4d937d356493b8469d8e442860a903c6c50313f308c5c87b6140d3873b8c345f6757636180ea18e3ae061b9df9cf19cd4541db8e238c527953d80addd')
sha512sums_aarch64=('eb7fa40a71e17094d750151154486871381668402b5f2f2415052d9a21382f03d752127eee979dff1daafeeaec95086b4a03af666b5c800914bae9c2c1e8834d')

# Version history with new versions is here.
#  https://docs.aws.amazon.com/systems-manager/latest/userguide/plugin-version-history.html

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
