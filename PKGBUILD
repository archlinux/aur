# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=12.4.1.4
pkgrel=1
pkgdesc='Kernel module for rtpengine media proxy'
arch=('x86_64')
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel'
	'linux-lts-headers: Build the module for LTS Arch kernel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sipwise/rtpengine/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('f9f916c281d730b1186ec1969dc644e6f3a08f4c3b1fc5a099993bdc67277933')

prepare() {
	cd rtpengine-mr${pkgver}
	# Set version
	sed -e "s|#MODULE_VERSION#|$pkgver|" -e "s|ngcp-||" debian/ngcp-rtpengine-kernel-dkms.dkms >dkms.conf
	# Insert patches below this line
}

package() {
	cd rtpengine-mr${pkgver}
	install -Dm644 -t "${pkgdir}/usr/src/rtpengine-${pkgver}" dkms.conf kernel-module/*
}
