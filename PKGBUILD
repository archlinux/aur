# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=velero-bin
pkgver=1.1.0
pkgrel=1
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
sha256sums=('e87e25488eea87717187ea1091dd0e5e322f3291040613c3c8bc85b60df28f2d')

package() {
  install -Dm 755 "$srcdir/velero-v${pkgver}-linux-amd64/velero" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/velero" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/velero"
  "$pkgdir/usr/bin/velero" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_velero"
}
