# Maintainer: Reese Wang <thuwrx10 at gmail dot com>

_pkgname='elxocmcorekit'
pkgname="${_pkgname}-legacy"
pkgver=12.8.614.12
pkgrel=1
pkgdesc="CLI manager of Emulex HBAs in physical and virtual server deployments, for legacy cards, but still receiving updates."
arch=('x86_64')
url="https://www.broadcom.com/products/storage/fibre-channel-host-bus-adapters/emulex-hba-manager"
license=('custom')
conflicts=('elxocmcorekit')
provides=('elxocmcorekit')
options=('!strip')
source=("file://elxocmcore-ubuntu16-20-${pkgver}-${pkgrel}.tgz")
sha256sums=('6262640193e7cfaa9db22d40bcb4628debd57e872a63719d224be0fca03a9073')

prepare() {
	ar x elxocmcore-ubuntu16-20-${pkgver}-${pkgrel}/x86_64/ubuntu-20/elxocmcorekit_${pkgver}-${pkgrel}_amd64.deb
}

package() {
	tar xf data.tar.xz -C "$pkgdir"
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
	mv "${pkgdir}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/"
	mv "${pkgdir}/lib" "${pkgdir}/usr/"
	mkdir -p "${pkgdir}/etc/profile.d"
	cat > "${pkgdir}/etc/profile.d/ocmanager.sh" <<__END__
export PATH="/opt/emulex/ocmanager/bin:$PATH"
__END__
}
