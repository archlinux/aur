# Maintainer: bbaa <bbaa@bbaa.me>

pkgname=i915-sriov-dkms
pkgver=2026.05.03
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
sha256sums=('7fd179ccf503ee6c985fdf2eb044c003e975c8e26f6c361ef199a91341e43874')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	echo "* Copying module into /usr/src..."
	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -r {compat,dkms.conf,drivers,include,Makefile} "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}
