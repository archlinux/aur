# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=1.8.2
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
conflicts=("${_pkgname}")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('1eda8d3700eeb1dd6a6351d7b55f0a0d01ac4355b5c2ab4c77ec320b47f966db');;
  aarch64) _CARCH=arm64 && sha256sums=('a4715740293a34acc043eb2ea6e9ef2ae68a742d1ee119183f9e068ac291a0b0');;
  armv7h)  _CARCH=armv7 && sha256sums=('522bc158731065eee306f2461c4ae03170461941ac40c3763a9bb2642acad367');;
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
