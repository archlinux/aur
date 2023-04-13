# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="qrcp-bin"
pkgver=0.10.1
pkgrel=2
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
url="https://github.com/claudiodangelis/qrcp"
arch=('x86_64' 'i386')
license=('MIT')
provides=('qrcp')
conflicts=('qrcp-git' 'qr-filetransfer-git' 'qrcp')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_x86_64.tar.gz")
source_i386=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_i386.tar.gz")
sha256sums_x86_64=(d9f1bdf1c9ae80dd7e731556be75341cf76e3462b6ae8405ca4f608c5370fd16)
sha256sums_i386=(ce95248a65548ab15f12acba7cd642c83efeb261bb28a92d6d913fa6ed48bb3a)


build() {
  ./qrcp completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/qrcp
  ./qrcp completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_qrcp
  ./qrcp completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/qrcp.fish
}

package() {
 install -Dm755 qrcp "$pkgdir/usr/bin/qrcp"
 cp -r share/ "$pkgdir/usr"
 install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
 install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
