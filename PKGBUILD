# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=velero-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/vmware-tanzu/velero"
depends=('kubectl')
provides=('velero')
conflicts=('velero')
license=('Apache-2.0')
source=("https://github.com/vmware-tanzu/velero/releases/download/v${pkgver}/velero-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f0ebd70e282b3f1a6cddcf081db5540c31a3ee00cb6b164f9ae698deae4640ba')

package() {
  install -Dm 755 "$srcdir/velero-v${pkgver}-linux-amd64/velero" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/velero" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/velero"
  "$pkgdir/usr/bin/velero" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_velero"
  "$pkgdir/usr/bin/velero" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/velero.fish"
}
