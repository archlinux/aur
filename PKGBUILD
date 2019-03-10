# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=kubeless
_upstream_pkgname=kubeless
pkgname=kubeless-bin
pkgver=1.0.2
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
  "99897555d4ac5a31c62ce1ee806e1a05d1eeaee62b6851ad79d7eef586ea7faa"
  "218bdf1f389121365ba47b8ed597ca10e75db1c004b48458504a9bc6ed09f131"
  "02107c484b74f9bd0d13b66e0a45981ee0e7d4a9024a1da0f9a1e6ca6b739ede"
  "3ebe31dc64ce67ff353e6ff6e377fd668fa984751a89bb3c475116d0db1f0742"
  "fdcee9e38cea79678ee1fa2cb86ce9889eea24899b526911dc982bf4519113b2"
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
