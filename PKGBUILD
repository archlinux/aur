# Maintainer: mingciong

pkgname=minikube-bin-aliyun
pkgver=1.2.0
pkgrel=1
pkgdesc="A tool that makes it easy to run Kubernetes locally in China"
url="https://github.com/AliyunContainerService/minikube"
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
source=(minikube_$pkgver::http://kubernetes.oss-cn-hangzhou.aliyuncs.com/minikube/releases/v$pkgver/minikube-linux-amd64)
sha256sums=('f276686e8b4d7c95b0e534b0610d5b6744aae55d70a2dcd1956011d6a52834b2')

package() {
  install -Dm755 minikube_$pkgver "$pkgdir/usr/bin/minikube"

  "$pkgdir/usr/bin/minikube" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/minikube"
  "$pkgdir/usr/bin/minikube" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_minikube"
}
