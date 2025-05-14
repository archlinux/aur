# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2025.05.11
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
sha256sums=('c6603057407bbe9e3a30e2bc9edb38b473c082370709d424abee7cb1bd61373a')

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
