# Maintainer: bbaa <bbaa@bbaa.fun>

pkgname=i915-sriov-dkms
pkgver=2024.09.21
pkgrel=1
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/strongtz/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${pkgname}-git" "${pkgname}-bbaa")
install=${pkgname}.install
source=("git+https://github.com/strongtz/i915-sriov-dkms.git#commit=e26ce8952e465762fc0743731aa377ec0b2889ff" "i915-set-sriov-numvfs.conf")
sha256sums=('585fbdbe99c9f3c54e14ae464e3139c54baafa4e8e957236fe75cd7404039d21'
            'b71ffb09e1345542e0137a8895ccca256c41f8e401964d23b08b337b882a811a')

package() {
  cd "$srcdir/$pkgname"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -rv ${srcdir}/$pkgname/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"

  cd "$srcdir"
  install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/usr/lib/tmpfiles.d/i915-set-sriov-numvfs.conf"
}

pkgver() {
  cd "$srcdir/$pkgname"
  cat VERSION
}
