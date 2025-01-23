# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2025.01.22
pkgrel=1
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/strongtz/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${pkgname}-git")
replace=("${pkgname}-bbaa-git")
backup=("etc/tmpfiles.d/i915-set-sriov-numvfs.conf")
install=${pkgname}.install
source=("git+https://github.com/strongtz/i915-sriov-dkms.git#tag=$pkgver" "i915-set-sriov-numvfs.conf")
sha256sums=('099650a2a580fe4373edb6f5726b5a4a1f5b7805a12b71ffb3d723f491bcd0fa'
            'e85e4d4c97cb1f6e825c47ea5e3a9c18f10761714307985f67b58c8e55a1e2c2')

package() {
  cd "$srcdir/$pkgname"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -rv ${srcdir}/$pkgname/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"

  cd "$srcdir"
  install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}
