# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Rene Benner <renebenner + arch at gmail dot com>
# Contributor: Troy Engel <troyengel + arch at gmail dot com>
# Contributor: Callum Denby <me@callumdenby.com>
pkgname=aws-session-manager-plugin
pkgver=1.2.792.0
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
sha512sums_x86_64=('9a079c6608efe43ff24c0383a9872e48185c05c764aeae7ecb1eae0df412cddaa1efde1d5d8b25070ee60fd841accd197ca7a1b9f1c00eb6def8f46c8ae1510c')
sha512sums_aarch64=('4c4104e299616d7ed0f20093d1402b8a1885e188ddd51482387c6f732c01376aece51f6a9c351846e0fe605c362c84d2f7360e51d7baf740aba665d77d1e1ade')

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
