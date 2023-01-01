# Maintainer: somini <dev@somini.xyz>
pkgname=tarsnystemd
pkgver=0.2
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
sha512sums=('5f4a6623ccc2bcd51904fa951e78f6d816853a4a68eabba14637f0967b10977aebc74b3aac31c56cae6169d80200681e22591baa6398b5552e5bd83c20087826')

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
