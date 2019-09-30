# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
optdepends=()
makedepends=()
conflicts=("${_pkgname}")

source=("https://github.com/istio/istio/releases/download/${pkgver}/istio-${pkgver}-linux.tar.gz")
sha256sums=('1a5aa78a150247dd4539611134a82c5ca887afc8056e397dd4ed128cb145c7ef')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "bin/istioctl" "${pkgdir}/usr/bin/istioctl"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/${_pkgname}"
  for d in install samples tools; do
    cp -R "${d}" "${pkgdir}/usr/share/${_pkgname}/"
  done
}
