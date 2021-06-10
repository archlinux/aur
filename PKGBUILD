# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=1.10.1
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
conflicts=("${_pkgname}")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('f7da085b39bfde4a635a48656c69cbf83031ab115a8f55166ee4cb60a710fa58');;
  aarch64) _CARCH=arm64 && sha256sums=('671f6502cb82a0a2f7e957195bb1296be45ffd28d7c8c06df4ca862625ec93ae');;
  armv7h)  _CARCH=armv7 && sha256sums=('d41c23b81f63a10731a5e685fae583a6b462f04e47cf02460adfcbe7f5d9024c');;
esac

source=("https://github.com/istio/istio/releases/download/${pkgver}/istio-${pkgver}-linux-${_CARCH}.tar.gz")

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "bin/istioctl" "${pkgdir}/usr/bin/istioctl"
  install -Dm644 "tools/_istioctl" "${pkgdir}/usr/share/zsh/site-functions/_istioctl"
  install -Dm644 "tools/istioctl.bash" "${pkgdir}/usr/share/bash-completion/completions/istioctl"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/${_pkgname}"
  for d in manifests samples tools; do
    cp -R "${d}" "${pkgdir}/usr/share/${_pkgname}/"
  done
}
