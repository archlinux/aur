# Maintainer: Didrole <Didrole@gmail.com>

pkgname=cato-client-bin
pkgver=5.2.0.3
pkgrel=1
pkgdesc='VPN client from Cato Networks to connect to the Cato Cloud.'
arch=('x86_64')
url='https://clientdownload.catonetworks.com/'
license=('custom')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('libarchive')

source=("https://clients.catonetworks.com/linux/${pkgver}/cato-client-install.deb"
        "cato-client-bin.sysusers"
        "cato-client-bin.tmpfiles"
)
sha256sums=('35482f3e6dab68687a48ee3157782aa4b3ce260c1986d716097b693b9434bbf9'
            '3c51ce0ebde44edf062e2c9db69c95949ee2031f4e85156f2f401d6e8767f704'
            'd381f7126126f45ca36e43bd33772bfa0aa6d9cbc9a720e2485fc6061cdd9435')

package() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
	mv "${pkgdir}/lib/systemd" "${pkgdir}/usr/lib/"
	rmdir "${pkgdir}/lib/"
	mv "${pkgdir}/usr/sbin/cato-clientd" "${pkgdir}/usr/bin/"
	rmdir "${pkgdir}/usr/sbin/"
	rmdir "${pkgdir}/usr/local/lib/"

	install -Dm644 "${srcdir}/../cato-client-bin.sysusers" "${pkgdir}/usr/lib/sysusers.d/cato-client-bin.conf"
	install -Dm644 "${srcdir}/../cato-client-bin.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/cato-client-bin.conf"
}
