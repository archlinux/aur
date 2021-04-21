# Maintainer: Leonidas P. <jpegxguy at outlook dot com>

_pkgname=ksmbd
pkgname=ksmbd-dkms
pkgver=3.3.9
pkgrel=1
pkgdesc="In-kernel CIFS/SMB3 server (aka cifsd), with the primary goal of improved I/O performance."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/cifsd"
license=('GPL2')
depends=('dkms')
options=('!strip')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cifsd-team/cifsd/archive/$pkgver.tar.gz"
        "dkms.conf")
sha256sums=("c196d1773b9f89221133780fd189b550acbc56ac93c2e79260a70eab9853b3e1"
            "1d844a3ced7c4b2227a71df1fcb48ffcb64c083a257715dd4afc193cf3f26240")

prepare() {
	sed -e "s/@VERSION@/$pkgver/" -i "$srcdir/dkms.conf"
}

package() {
	mkdir -p "${pkgdir}/usr/src"
	cp -r "cifsd-${pkgver}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
	install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
}
