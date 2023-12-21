# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=1.6.0
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("clusterctl-linux-amd64-v$pkgver::https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('1f9d967b0a8fa8cf50fd86203658a8ddacbc7b4d5aafafccb1653aa0b38169ce')

package() {
    install -Dm0755 "$srcdir/clusterctl-linux-amd64-v$pkgver" "$pkgdir/usr/bin/clusterctl"
    install -dm0755 "$pkgdir/usr/share/zsh/site-functions/"
    install -dm0755 "$pkgdir/usr/share/bash-completion/completions/"
    "$pkgdir/usr/bin/clusterctl" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_clusterctl"
    "$pkgdir/usr/bin/clusterctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/clusterctl"
}
