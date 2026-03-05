# Maintainer: bbaa <bbaa@bbaa.me>

pkgname=i915-sriov-dkms
pkgver=2026.03.05
pkgrel=1
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/strongtz/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${pkgname}-git")
backup=("etc/tmpfiles.d/i915-set-sriov-numvfs.conf")
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/strongtz/i915-sriov-dkms/tar.gz/$pkgver")
sha256sums=('59904a5d681ec053be07c66a56c7cba9a57cb14c423ae2900ba4ed0206ef12d2')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	echo "* Copying module into /usr/src..."
	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -r {compat,dkms.conf,drivers,include,Makefile} "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}
