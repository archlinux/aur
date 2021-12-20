# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

_pkgname=ksmbd
pkgname=ksmbd-dkms
pkgver=3.4.3
pkgrel=1
pkgdesc="In-kernel SMB server, with the primary goal of improved I/O performance."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd"
license=('GPL2')
depends=('dkms')
provides=('KSMBD-MODULE')
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "dkms.conf")
sha256sums=("a910c55d9e6924775e00504eddd00b49788603af29d0772cb9fb6722c189f628"
            "1d844a3ced7c4b2227a71df1fcb48ffcb64c083a257715dd4afc193cf3f26240")

prepare() {
	sed -e "s/@VERSION@/${pkgver}/" -i "${srcdir}/dkms.conf"
}

package() {
	mkdir -p "${pkgdir}/usr/src"
	cp -r "${_pkgname}-${pkgver}" "${pkgdir}/usr/src/"
	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
}
