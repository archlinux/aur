# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=velero-bin
pkgver=1.13.2
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/vmware-tanzu/velero"
depends=('kubectl')
provides=('velero')
conflicts=('velero')
license=('Apache')
source=("https://github.com/vmware-tanzu/velero/releases/download/v${pkgver}/velero-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f460ef5594c7f7b43a74a6c560268723cd7386e0e7ff8e172643ea236f579033')

package() {
  install -Dm 755 "$srcdir/velero-v${pkgver}-linux-amd64/velero" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/velero" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/velero"
  "$pkgdir/usr/bin/velero" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_velero"
  "$pkgdir/usr/bin/velero" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/velero.fish"
}
