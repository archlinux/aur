# Maintainer: Muhkoenig

pkgname=minikube-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="A tool that makes it easy to run Kubernetes locally"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
optdepends=(
  'kubectl: to manage the cluster'
  'crictl: to use --vm-driver=none'
  'virtualbox: to use --vm-driver=virtualbox (default)'
  'docker-machine-kvm: to use --vm-driver=kvm'
  'docker-machine-driver-kvm2: to use --vm-driver=kvm2'
)
makedepends=()
provides=('minikube')
conflicts=('minikube')
source=(minikube_$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha256sums=('eabd027438953d29a4b0f7b810c801919cc13bef3ebe7aff08c9534ac2b091ab')

package() {
  install -Dm755 minikube_$pkgver "$pkgdir/usr/bin/minikube"

  "$pkgdir/usr/bin/minikube" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/minikube"
  "$pkgdir/usr/bin/minikube" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_minikube"
}
