# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=velero-bin
pkgver=1.17.2
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/vmware-tanzu/velero"
depends=('kubectl')
provides=('velero')
conflicts=('velero')
license=('Apache-2.0')
source=("https://github.com/vmware-tanzu/velero/releases/download/v${pkgver}/velero-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('2dfc9dd57753bae1c3853b461cdd6d59304ea51313d8368b8465a71c3697240a')

package() {
  install -Dm 755 "$srcdir/velero-v${pkgver}-linux-amd64/velero" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/velero" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/velero"
  "$pkgdir/usr/bin/velero" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_velero"
  "$pkgdir/usr/bin/velero" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/velero.fish"
}
