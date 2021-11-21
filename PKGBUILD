# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=microshift-bin
pkgver=4.8.0_0.microshift_2021_11_19_115908
pkgrel=1
pkgdesc="A small form factor OpenShift/Kubernetes optimized for edge computing"
url="https://github.com/redhat-et/microshift"
arch=("x86_64" "aarch64")
backup=(
  "etc/cni/net.d/100-crio-bridge.conf"
  "usr/lib/systemd/system/microshift.service"
)
provides=("microshift")
conflicts=("microshift")
depends=("cri-o" "crictl" "kubectl" "conntrack-tools")
license=("APACHE")

source=(
  "https://raw.githubusercontent.com/redhat-et/microshift/${pkgver//_/-}/LICENSE"
# TODO: these are not available on the current release
#  "https://raw.githubusercontent.com/redhat-et/microshift/${pkgver//_/-}/packaging/images/microshift-aio/crio-bridge.conf"
#  "https://raw.githubusercontent.com/redhat-et/microshift/${pkgver//_/-}/packaging/systemd/microshift.service"
)
source_x86_64=("${pkgname}-${pkgver}::https://github.com/redhat-et/microshift/releases/download/${pkgver//_/-}/microshift-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/redhat-et/microshift/releases/download/${pkgver//_/-}/microshift-linux-arm64")

sha256sums=(
  "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30"
#  ""
#  ""
)
sha256sums_x86_64=("e65e8ecb08c5d9dc85d7145d3e528d6d4b925433a51a5ab04c5b844a3924ff7f")
sha256sums_aarch64=("45b8c429184eb7c83cd7166a6747d9746d2472e17091633aee6b0a6f624961d2")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/microshift"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"

  # install -Dm644 "${srcdir}/microshift.service" "${pkgdir}/usr/lib/systemd/system/microshift.service"

  # update default cri-o config to match Microshift networking values
  # install -Dm644 "${srcdir}/crio-bridge.conf" "${pkgdir}/etc/cni/net.d/100-crio-bridge.conf"

  # TODO: how can we properly update this file if we don't own it? Remove the above install when you figure it out!
  # sed -i --follow-symlinks 's|10.85.0.0/16|10.42.0.0/24|' "${pkgdir}/etc/cni/net.d/100-crio-bridge.conf"
  # sed -i --follow-symlinks 's/0.3.1/0.4.0/' "${pkgdir}/etc/cni/net.d/100-crio-bridge.conf"
}
