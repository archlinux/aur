# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=kubeless
_upstream_pkgname=kubeless
pkgname=kubeless-bin
pkgver=1.0.1
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
sha256sums=(
  "cab96cd4d4c1580ff894417f9f2347752c6b48eeb7ab06c0b493813972138953"
  "db4841f7963352b10925f721b9ee23703807d90c928a6da0d995de6f11134ab5"
  "313fc127c899d53fbf4a77e5db2ca1d9e99531546f6aa150186ee088f62db35b"
  "a90ec8bd568f4dfb35c11c6da87474173d89d066271c3e7fa5469466025123b0"
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
