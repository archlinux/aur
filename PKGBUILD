# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=kubeless
_upstream_pkgname=kubeless
pkgname=kubeless-bin
pkgver=1.0.0
pkgrel=2
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
sha256sums=(
  "e6ba1f7ae5eb738f21bab467d59e37180b3fd35d7c5eeff6a042c9188bf62a50"
  "46eac388615d61f836f6443c9c56eb1d744ee83a2de45ccbbd09b056df7c9f1f"
  "e7174be38cb62c8899acee2a469c45ade79d44c4bf34b2b494f3b6d215b69e92"
  "17c8c019c9d6283e07add61db4d223d342b885931bc959f47c91d2dd80df8faa"
  "SKIP"
)

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
