# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=1.3.2
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("clusterctl-linux-amd64-v$pkgver::https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('d57adc75cd4359a9f660b2ecbbd0ef82ebfa643c1218a6ca8ca1778bdda72380')

package() {
    install -Dm0755 "$srcdir/clusterctl-linux-amd64-v$pkgver" "$pkgdir/usr/bin/clusterctl"
    install -dm0755 "$pkgdir/usr/share/zsh-completions/site-functions/"
    install -dm0755 "$pkgdir/usr/share/bash-completion/completions/"
    "$pkgdir/usr/bin/clusterctl" completion zsh > "$pkgdir/usr/share/zsh-completions/site-functions/_clusterctl"
    "$pkgdir/usr/bin/clusterctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/clusterctl"
}
