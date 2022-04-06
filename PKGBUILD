# Maintainer: Rene Benner <renebenner + arch at gmail dot com>
pkgname=aws-session-manager-plugin
pkgver=1.2.312.0
pkgrel=1
pkgdesc="AWS Session Manager Plugin for aws-cli."
arch=('x86_64' 'aarch64')
url="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
license=('custom')
depends=('aws-cli')
backup=('usr/lib/systemd/system/session-manager-plugin.service' 'usr/sessionmanagerplugin/LICENSE' 'usr/sessionmanagerplugin/seelog.xml' 'usr/sessionmanagerplugin/VERSION')
options=('!strip' '!emptydirs')
source_x86_64=("${pkgname}-${pkgver}.deb"::https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_64bit/session-manager-plugin.deb)
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb"::https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_arm64/session-manager-plugin.deb)
sha512sums_x86_64=('0ee3978e197308395f85126ce9a59e427c50b0e3832cb2337b2ca29a687463b7238668e431e18b3a0be5dc9c278d5c9663cfb1d6fcdee5abc4673b900855c16a')
sha512sums_aarch64=('fb07b660598ac5f6f765a040d2e1efa9b4df62e1b2558b1a259db21c6f53cafbb7ddf27262002156bad67b23da865e9181d972f6d57c7bd371d24cb5d899d7e6')


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
