# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=kubeless
_upstream_pkgname=kubeless
pkgname=kubeless-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A Kubernetes-native serverless framework that lets you deploy small bits of code without having to worry about the underlying infrastructure plumbing."
arch=('x86_64')
_goarch="amd64"
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
_manifest_non_rbac="${_upstream_pkgname}-non-rbac-v${pkgver}.yaml"
_manifest_openshift="${_upstream_pkgname}-openshift-v${pkgver}.yaml"
_manifest_rbac="${_upstream_pkgname}-v${pkgver}.yaml"
url="https://github.com/${_pkgauthor}/${_upstream_pkgname}"
license=("Apache")
### https://github.com/kubeless/kubeless/releases/download/v1.0.0/kubeless_linux_x86_64.zip
### https://github.com/kubeless/kubeless/releases/download/v1.0.0/kubeless_linux-amd64.zip
source=("${_upstream_pkgname}-${pkgver}.zip::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}_linux-${_goarch}.zip"
  "${_upstream_pkgname}-non-rbac-v${pkgver}.yaml::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}-non-rbac-v${pkgver}.yaml"
  "${_upstream_pkgname}-openshift-v${pkgver}.yaml::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}-openshift-v${pkgver}.yaml"
  "${_upstream_pkgname}-v${pkgver}.yaml::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}-v${pkgver}.yaml"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_upstream_pkgname}/master/LICENSE")
sha256sums=('402b5a7ff55d9ea907ba444e38ce143aeb7996fe824a3b222f1a269084a84c30'
            '374db1fe2fb9f16d9d9d2711e2cd0b58ea378dd2e4ff3992fca38bd22c5741f3'
            '83203643321fda0363f2fae364287752589906a132e9f88a3ecdd737df298ed5'
            'b98a7f73d22b75faecc2747e93cd38a6f789262edb130c083ffb7e747d6cde63'
            'fdcee9e38cea79678ee1fa2cb86ce9889eea24899b526911dc982bf4519113b2')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${srcdir}/bundles/${_upstream_pkgname}_linux-${_goarch}/${_upstream_pkgname}" "${pkgdir}/usr/bin/${_upstream_pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${_upstream_pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${_upstream_pkgname}"
  cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_upstream_pkgname}"

  mkdir -p "${pkgdir}/usr/share/${_upstream_pkgname}/manifests"
  cp "${srcdir}/${_manifest_non_rbac}" "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"
  cp "${srcdir}/${_manifest_openshift}" "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"
  cp "${srcdir}/${_manifest_rbac}" "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"
  chmod 644 "${pkgdir}/usr/share/${_upstream_pkgname}/manifests/"*.yaml
}
