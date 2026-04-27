# Maintainer: bbaa <bbaa@bbaa.me>

pkgname=i915-sriov-dkms
pkgver=2026.03.05
_commit=0f2527cd4043a44ad8fa984e0c1ae2e56a93d49a
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
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/strongtz/i915-sriov-dkms/tar.gz/$_commit")
sha256sums=('66c825dfddba968bd51a3d88443d3ffc2a26061a43114457537d10e93c9312e2')

package() {
	cd "$srcdir/$pkgname-$_commit"

	echo "* Copying module into /usr/src..."
	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -r {compat,dkms.conf,drivers,include,Makefile} "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}
