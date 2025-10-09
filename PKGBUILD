# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2025.10.09
pkgrel=2
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/strongtz/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${pkgname}-git")
backup=("etc/tmpfiles.d/i915-set-sriov-numvfs.conf")
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/strongtz/i915-sriov-dkms/tar.gz/$pkgver-$pkgrel")
sha256sums=('9990fdba78f95b2555f102c894aab933de55269e24b773c45e18cd5454b7de60')

package() {
	cd "$srcdir/$pkgname-$pkgver-$pkgrel"

	echo "* Copying module into /usr/src..."
	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -r {compat,dkms.conf,drivers,include,Makefile} "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}
