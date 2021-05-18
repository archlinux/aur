# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=1.10.0
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
conflicts=("${_pkgname}")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('1d00a2ea0cb7608ce2266fc65572ac9316978b01c0c2c8dd8c65efcb63f5fe97');;
  aarch64) _CARCH=arm64 && sha256sums=('9c9b4e8780f50b14c9482528f5176a48274906e4f46435ff2251148ebf108de7');;
  armv7h)  _CARCH=armv7 && sha256sums=('87aec26e3a341e068b485783b233cd79b6e6f8bd5421422c27d27bbc21fff9ec');;
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
