# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.26.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubelet' 'kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "kubelet.service"
)
b2sums=('edaa6c5354476c2047d75c0984321aa2fa92dae715c15555b6923fe08a88bfdebc94a7e72bc87c3f187ae98fd9ce1c257b9a7a9e1b6ef36a5faccba1946d4835')

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    b2sums+=('67dd89156ef395e8d41d2325b2fb6303e2e5430c04ca087d13c54eac414fa417fd5833f637d1e6a780be97653aad281336022f17eb51e777f25e35ac2790b198')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('d4bc6f3c7c04c0f6aa5d5ef7c9e0c400f48cecbf08583bd4ce3b1de170cad36626ae8bcc36f01ce094a85a0aa683bb30f5c494a0e6253790b05eda4605a3c817')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('564f25973f12a9d7cf7110953aee09dd25f7099cbdd148543d29cbd89a7020c81b976a56ab0818598c41ed15916f766479ed869aac2bc266e28183144fee6259')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}
