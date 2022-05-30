# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: zer0def <zer0def on github>

pkgname=kubedee
pkgver=0.7.0
pkgrel=2
pkgdesc='Multi-node Kubernetes clusters on LXD'
arch=('any')
url="https://github.com/zer0def/${pkgname}"
license=('Apache')
depends=(
    'bash'
    'lxd'
    'btrfs-progs'
    'cfssl'
    'jq'
    'kubectl'
)
optdepends=(
    'cni-plugins'
    'cri-o'
    'docker-registry'
    'etcd'
    'kube-apiserver'
    'kube-controller-manager'
    'kube-proxy'
    'kube-scheduler'
    'kubelet'
    'runc'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('425ab69c52e4eb877e55c5152ed7216ab107255d8d06da6644b14110b32fdd8a5ff91be953256cd4fa820733f277dd81c8e54db5508d9f6fcf770c110c8e55f5')

package() {
    cd ${pkgname}-${pkgver}
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 "lib.bash" -t "${pkgdir}/usr/share/${pkgname}"
    ln -s ../share/${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/manifests/" manifests/*
}
