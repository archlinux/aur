# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=1.8.1
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
conflicts=("${_pkgname}")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('cb39fb7fc8d99b172aefc7dba197588839d15ce682f515684548ec21301e13ff');;
  aarch64) _CARCH=arm64 && sha256sums=('e255188efd5fc6ab9ea65c206ea66d5c8af354967950c17ef6bf106e270ab7f6');;
  armv7h)  _CARCH=armv7 && sha256sums=('d58fa6eb5f2242386b04c5599be55e8090d2f6d289fc772b386986a1855d4fd7');;
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
