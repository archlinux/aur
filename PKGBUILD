# Maintainer: dszryan <9117127+dszryan@users.noreply.github.com>
# Ref: https://github.com/jldeen/helm3-demo/blob/master/scripts/setup-helm3.sh

pkgname=kubernetes-helm-git
pkgver=3.0.0
_rc_ver="rc.2"
pkgrel=3
pkgdesc="A tool to manage Kubernetes charts - helm3 (no tiller)"
arch=('x86_64')
url="https://github.com/helm/helm"
depends=('go' 'socat')
optdepends=(
  'kubectl: check cluster status'
  'kubectl-bin: check cluster status - binary package'
)
license=('Apache')
source=("https://get.helm.sh/helm-v${pkgver}-${_rc_ver}-linux-amd64.tar.gz")
sha256sums=('b6fff8e01aa6cd9a4541bd48172bb53b9a0ae38d7e7783a8e0fcc1db63802aaa')
install="${pkgname}.install"

package() {
  install -Dm755 "$srcdir/linux-amd64/helm" -T "$pkgdir/usr/bin/helm3"

  "$pkgdir/usr/bin/helm3" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/helm3"
  "$pkgdir/usr/bin/helm3" completion zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_helm3"
}
