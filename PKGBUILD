# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=velero-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/velero"
optdepends=(
  'kubectl: To connect to Kubernetes'
  'kubectl-bin: To connect to Kubernetes'
)
replaces=('ark-bin')
install="velero-bin.install"
license=('Apache')
source=("https://github.com/heptio/velero/releases/download/v${pkgver}/velero-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('4080a37b487a859b5bba8391e965267cd0fe29cd67fd070b6f695fed45619e2c')

package() {
  install -Dm 755 "$srcdir/velero-v${pkgver}-linux-amd64/velero" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/velero" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/velero"
  "$pkgdir/usr/bin/velero" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_velero"
}
