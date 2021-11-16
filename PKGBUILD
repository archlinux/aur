# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=microshift-bin
pkgver=4.8.0_0.microshift_2021_11_11_151353
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
sha256sums_x86_64=("059b1ccf408ffaa4ffcd403c52b806da0df23bea47a00bd4e599541583a53e98")
sha256sums_aarch64=("37655bd6659f3bd62e5989c11360f56120ebd5f08b6baa2db98afa73a4d687fd")

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
