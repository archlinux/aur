# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2025.07.22
pkgrel=1
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/strongtz/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${pkgname}-git")
backup=("etc/tmpfiles.d/i915-set-sriov-numvfs.conf" "etc/modprobe.d/i915-sriov-dkms.conf")
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/strongtz/i915-sriov-dkms/tar.gz/$pkgver")
sha256sums=('b25be72732521aff5b8feb643cc363f7d0f582124e5efb227dc906fa264bf4b0')

package() {
	cd "$srcdir/$pkgname-$pkgver"
  
	echo "* Copying module into /usr/src..."
	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -rv * "${pkgdir}/usr/src/${pkgname}-${pkgver}"

	install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
	install -Dm644 i915-modprobe.conf "${pkgdir}/etc/modprobe.d/i915-sriov-dkms.conf"
}
