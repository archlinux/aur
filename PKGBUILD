# Maintainer: sehraf

_pkgname=ubrb
pkgname=${_pkgname}-git
pkgver=v1
pkgrel=4
pkgdesc='Store data (e.g. LUKS keyfile) in RAM of external devices'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/sehraf/ubrb.git'
license=('MIT')
optdepends=('vim: xxd / hex de-/encoding used by mkinitcpio')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/conf.d/ubrb.conf')

source=("${_pkgname}::git+https://github.com/sehraf/ubrb.git")
sha256sums=('SKIP')

#pkgver() {
#	cd "${srcdir}/${_pkgname}"
#	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
	cd "${srcdir}/${_pkgname}/UBRB_HostReceiver"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm755 UBRB_HostReceiver/ubrb "${pkgdir}/usr/bin/ubrb"

	install -Dm644 mkinitcpio/hooks/ubrb		"${pkgdir}/usr/lib/initcpio/hooks/ubrb"
	install -Dm644 mkinitcpio/install/ubrb		"${pkgdir}/usr/lib/initcpio/install/ubrb"
	install -Dm644 mkinitcpio/etc/conf.d/ubrb.conf	"${pkgdir}/etc/conf.d/ubrb.conf"

	install -Dm644 systemd/ubrb.service "${pkgdir}/usr/lib/systemd/system/ubrb.service"
}

