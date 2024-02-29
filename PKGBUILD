# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=azure-kubelogin-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Kubernetes credential (exec) plugin implementing azure authentication"
arch=('x86_64')
url="https://github.com/Azure/kubelogin"
provides=('azure-kubelogin')
conflicts=('azure-kubelogin')
license=('MIT')
source=("$pkgname-$pkgver.zip::https://github.com/Azure/kubelogin/releases/download/v${pkgver}/kubelogin-linux-amd64.zip")
sha256sums=('51938ead06738bce6bb8fa4418fe043a5106a7d8bad037a65b57170c4f3fba0e')

package() {
  install -Dm 755 "$srcdir/bin/linux_amd64/kubelogin" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/kubelogin" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kubelogin"
  "$pkgdir/usr/bin/kubelogin" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kubelogin"
  "$pkgdir/usr/bin/kubelogin" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/kubelogin.fish"
}
