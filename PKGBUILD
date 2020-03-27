# Maintainer: Muhkoenig

pkgname=minikube-bin
pkgver=1.9.0
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
sha256sums=('81d77d1babe63be393e0a3204aac7825eb35e0fdf58ffefd9f66508a43864866')

package() {
  install -Dm755 minikube_$pkgver "$pkgdir/usr/bin/minikube"

  "$pkgdir/usr/bin/minikube" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/minikube"
  "$pkgdir/usr/bin/minikube" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_minikube"
}
