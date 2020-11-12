# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.19.4
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubeadm')
source=(
  "10-kubeadm.conf"
)
sha256sums=('8af7f7910fd8710ce02af03170e109c6dc6d4d74eb2cc06f90530be4f0090b65')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('9b83c9dcda775e9b5a20d7254218e8b70cea8a37266d254b6289faa1d5602cd9')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('1357ce6314a2b4a2303a96c33c996e7e9e8269cf4cc464557e7fa09f9a6ade34')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('e1977c6ba7acc7b2b3896202c93a73dbdf1c649b93843350e0f10172e26cf59d')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubeadm"
}
