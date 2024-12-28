# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2024.12.28
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
source=("git+https://github.com/strongtz/i915-sriov-dkms.git#commit=f68199f72ee35b4fb7d1ac0717cc90e63e8d93c2" "i915-set-sriov-numvfs.conf")
sha256sums=('a543dd83abdaa893d2a5fbe69f1a8192425530dee6ccdab69a8c407ec16f96ac'
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
