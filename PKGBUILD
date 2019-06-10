# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=kubeless
_upstream_pkgname=kubeless
pkgname=kubeless-bin
pkgver=1.0.3
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
sha256sums=('cb1cd4b748c10ba896f4e00a35055303ec19143b8cf79a6b174110c1e84ec998'
            '21c1c45306453b53e6d22a7356367d76d33d80e50eb22d8ee7e0d0416b43b7c5'
            '95c1abd4d39f56caecf1234b8d0574552f1e2bd15d42ed09aaf7d8d54340cfb6'
            'b4f0e2eeca068370627d91670190b67324c26603a67b8af7cdf7d1e10f596c86'
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
