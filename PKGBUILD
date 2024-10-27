# Maintainer: bbaa <bbaa@bbaa.fun>
_pkgname=i915-sriov-dkms
pkgname=i915-sriov-dkms-bbaa-git
pkgver=2024.10.07
pkgrel=1
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/bbaa-bbaa/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgname}" "${_pkgname}-git")
install=${_pkgname}.install
source=("git+https://github.com/bbaa-bbaa/i915-sriov-dkms.git" "i915-set-sriov-numvfs.conf")
sha256sums=('SKIP'
            'b71ffb09e1345542e0137a8895ccca256c41f8e401964d23b08b337b882a811a')

package() {
  cd "$srcdir/$_pkgname"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -rv ${srcdir}/$_pkgname/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  cd "$srcdir"
  install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/usr/lib/tmpfiles.d/i915-set-sriov-numvfs.conf"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  cat VERSION
}
