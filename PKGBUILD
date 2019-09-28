# Maintainer: dszryan <9117127+dszryan@users.noreply.github.com>
# Ref: https://github.com/jldeen/helm3-demo/blob/master/scripts/setup-helm3.sh

pkgname=kubernetes-helm-git
pkgver=3.0.0
_betaver="beta.3"
pkgrel=2
pkgdesc="A tool to manage Kubernetes charts - helm3 (no tiller)"
arch=('x86_64')
url="https://github.com/helm/helm"
depends=('go' 'socat')
optdepends=(
  'kubectl: check cluster status'
  'kubectl-bin: check cluster status - binary package'
)
license=('Apache')
source=("https://get.helm.sh/helm-v${pkgver}-${_betaver}-linux-amd64.tar.gz")
sha256sums=('23705380590bdb3e70e1bc8649fe1c90a75905bdc12ae6e6f6a9c16db9801594')
install="${pkgname}.install"

package() {
  install -Dm755 "$srcdir/linux-amd64/helm" -T "$pkgdir/usr/bin/helm3"

  "$pkgdir/usr/bin/helm3" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/helm3"
  "$pkgdir/usr/bin/helm3" completion zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_helm3"
}
