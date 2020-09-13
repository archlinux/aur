# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: peace4all <markspost at rocketmail dot com>

pkgname=unified-remote-server
pkgver=3.8.0.2451
pkgrel=1
pkgdesc="Unified Remote Server"
arch=('x86_64')
url="http://www.unifiedremote.com/"
depends=('glibc' 'gcc-libs')
license=('freeware')
install=$pkgname.install
source=("https://www.unifiedremote.com/download/linux-x64-deb" "urserver.service")
sha256sums=('SKIP' '2a2a6118aa028a4ca38638845d1b8d408d57332f3b88c02ff00d5c7f5321428a' )

package() {
	cd ${srcdir}

	# decompress data
	tar xvf data.tar.xz

	# install folders
	mkdir -p ${pkgdir}/{opt,usr}
	cp -r {opt,usr} "${pkgdir}/"

	# clean up permissions
	find "${pkgdir}" -type d | xargs -I {} chmod -R 755 "{}"
	find "${pkgdir}" -type f | xargs -I {} chmod -R 644 "{}"
	chmod 755 "${pkgdir}/opt/urserver/urserver"
	chmod 755 "${pkgdir}/opt/urserver/urserver-start"
	chmod 755 "${pkgdir}/opt/urserver/urserver-stop"
	
	# add systemd service
        install -Dm644 "urserver.service" "$pkgdir/usr/lib/systemd/user/urserver.service"
}

