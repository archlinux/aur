# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: Mikkel <mikkeloscar@gmail.com>

pkgname=kubernetes-bin
pkgver=1.19.0
pkgrel=0
pkgdesc="Production-Grade Container Scheduling and Management - binary version."
optdepends=('etcd: etcd cluster required to run Kubernetes')
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
source=("v$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes.tar.gz"
    "kubernetes.install")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-amd64.tar.gz")
source_armv7l=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-arm.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-arm.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://dl.k8s.io/v$pkgver/kubernetes-server-linux-arm64.tar.gz")
url="https://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
provides=('kubernetes'
          'kubelet'
	  'kubeadm'
	  'kubectl'
	  'kube-proxy'
	  'kube-apiserver'
	  'kube-controller-manager'
	  'kube-scheduler')
conflicts=('kubernetes' 'kubeadm-git' 'kubectl' 'kubectl-bin' 'kubeadm-bin' 'kubelet-bin' )
install=kubernetes.install
sha512sums=('448b941e973a519a500eb24786f6deb7eebd0e1ecb034941e382790ff69dfc2838715a222cfc53bea7b75f2c6aedc7425eded4aad69bf88773393155c737f9c0'
            '19d70634252932e7835bb5db4af75c530fe843386ca688267caca0fb3b4fb1ad7019025ea9d59926ceac8817580e9dfad9396c327f2da955146a302f22b2d5ce')
sha512sums_x86_64=('7c268bd58e67d3c5016f3fcc9f4b6d2da7558af5a2c708ff3baf767b39e847e3d35d4fd2fa0f640bedbfb09a445036cafbe2f04357a88dada405cfc2ded76972')
sha512sums_armv7l=('fcbf8d9004f1cd244a82b685abaf81f9638c3cc1373d78e705050042cfa6a004f8eed92f4721539dcd169c55b662d10416af19cff7537a8dfef802dc41b4088b')
sha512sums_armv7h=("${sha512sums_armv7l}")
sha512sums_aarch64=('e21f54a35ff29e919e98fe81758f654ea735983d5a9d08dab9484598b116843830a86ceb5cf0a23d27b7f9aba77e5f0aa107c171a0837ba781d508ebbea76f55')

package() {
    cd $srcdir/kubernetes

    binaries=(
        kube-proxy
        kube-apiserver
        kube-controller-manager
        kubelet
        kubeadm
        kube-scheduler
        kubectl
    )
    for bin in "${binaries[@]}"; do
        install -Dm755 $srcdir/kubernetes/server/bin/$bin $pkgdir/usr/bin/$bin
    done

    # install the place the kubelet defaults to put volumes
    install -d $pkgdir/var/lib/kubelet
}
