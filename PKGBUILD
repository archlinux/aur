# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=1.2.3
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
sha256sums=('ecf8a759a4c41bd7c0fb3515c61b13f6d1252552a235e147c75212566cf15691')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "bin/istioctl" "${pkgdir}/usr/bin/istioctl"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/${_pkgname}"
  for d in install samples tools; do
    cp -R "${d}" "${pkgdir}/usr/share/${_pkgname}/"
  done
}
