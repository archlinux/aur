# Contributor: Ben Alex <ben.alex@acegi.com.au>
# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=elephantdrive
pkgver=3.8.3
pkgrel=1
pkgdesc='Service for the Elephant Drive encrypted cloud backup service'
arch=('x86_64')
url="http://www.elephantdrive.com"
license=('custom')
backup=('etc/elephantdrive.config')

source=('elephantdrive.service'
        "http://distribution.vaultservices.net/edNative/out/debian/elephantdrive_${pkgver}_amd64.deb")
noextract=("elephantdrive_${pkgver}_amd64.deb")
sha256sums=('06f9908b0086fd65ef022f764a6c10833dbc39f72c40e6290f2edc2cfc37fb86'
            '50ca532ec9c720fb88286b1d987ae2a737c0f8cc54d18a090944e0a8de292062')

package() {
	ar xf "elephantdrive_${pkgver}_amd64.deb"
	tar xf data.tar.xz -C "${srcdir}"
	install -Dm755 ${srcdir}/usr/sbin/elephantdrive ${pkgdir}/usr/bin/elephantdrive
	install -Dm600 ${srcdir}/etc/elephantdrive.config ${pkgdir}/etc/elephantdrive.config
	install -Dm644 ${srcdir}/elephantdrive.service ${pkgdir}/usr/lib/systemd/system/elephantdrive.service
}
