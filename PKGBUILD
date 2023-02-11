# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: peace4all <markspost at rocketmail dot com>

pkgname=unified-remote-server
pkgver=3.13.0.2505
build=2505
pkgrel=1
pkgdesc="Unified Remote Server"
arch=('x86_64')
url="http://www.unifiedremote.com/"
depends=('glibc' 'gcc-libs')
license=('freeware')
install=$pkgname.install
source=("https://www.unifiedremote.com/static/builds/server/linux-x64/$build/urserver-$pkgver.deb" "urserver.service")
sha256sums=('588596ed242597b5e9f09c24f900ee72a33a4d2f48fd6f4afb5f3e48300af42b' '2a2a6118aa028a4ca38638845d1b8d408d57332f3b88c02ff00d5c7f5321428a' )

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

