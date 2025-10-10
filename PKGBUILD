# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2025.10.10
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
sha256sums=('22e3513709a0797e5ef6cf08815daa689d4b07b5cf3b72046561501ae3144546')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	echo "* Copying module into /usr/src..."
	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -r {compat,dkms.conf,drivers,include,Makefile} "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}
