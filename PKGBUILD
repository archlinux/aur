# Maintainer: somini <dev@somini.xyz>
pkgname=tarsnystemd
pkgver=0.1
_pkgver="v$pkgver"
pkgrel=2
pkgdesc="SystemD and tarsnap, finally together."
arch=('any')
url="https://gitlab.com/somini/tarsnystemd"
license=('GPL3')
depends=('tarsnap')
makedepends=()
optdepends=()
backup=('etc/tarsnap.conf')
source=(
	"$pkgname-$pkgver.tar.gz::$url/-/archive/$_pkgver/$pkgname-$_pkgver.tar.gz"
)
sha512sums=('2893386fec049f69cd3946ad265eeefc0ad9cf95c8cd1bc1920a457801bf388029d2195da2c49aa7545072d52448744580d0c9b0e71443f2b651a37213c4fd31')

package() {
	cd "$pkgname-${_pkgver}"
	# Single Files
	install -D -m755 "tarsnystemd" "${pkgdir}/usr/bin/tarsnystemd"
	install -D -m644 "tarsnap-system.conf" "${pkgdir}/etc/tarsnap/tarsnap.conf"
	install -D -m644 "tarsnystemd.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/tarsnystemd.conf"
	# Folders
	install -D -m644 -t "${pkgdir}/usr/lib/systemd/system" system/*
	install -D -m644 -t "${pkgdir}/usr/lib/systemd/user" user/*

}
