# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2025.05.18
pkgrel=1
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/strongtz/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${pkgname}-git")
replace=("${pkgname}-bbaa-git")
backup=("etc/tmpfiles.d/i915-set-sriov-numvfs.conf" "etc/modprobe.d/i915-sriov-dkms.conf")
install=${pkgname}.install
source=("git+https://github.com/strongtz/i915-sriov-dkms.git#tag=$pkgver")
sha256sums=('842e45e828e7d74812e06b340fcec9cfe85e29a2c48e3a7b3e09343d47f08da3')

package() {
  cd "$srcdir/$pkgname"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -rv ${srcdir}/$pkgname/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"

  install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
  install -Dm644 i915-modprobe.conf "${pkgdir}/etc/modprobe.d/i915-sriov-dkms.conf"
}
