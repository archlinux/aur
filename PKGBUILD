# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='istio'
pkgname="${_pkgname}-bin"
pkgver=1.7.3
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
conflicts=("${_pkgname}")

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('027ca706cadd96b3013b31bae1365ef94ed41feef0018e871f64a8c4e6275402');;
  aarch64) _CARCH=arm64 && sha256sums=('def1496047731346b1039664f834cf17bbf9e584e56e110b5ed73c4b29360b69');;
  armv7h)  _CARCH=armv7 && sha256sums=('9700f9e65f7b23d2d01290e5af63cfed858838f0e7e8d16e5ef5d0feeee125f4');;
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
