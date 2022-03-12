# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="qrcp-bin"
pkgver=0.9.0
pkgrel=1
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
url="https://github.com/claudiodangelis/qrcp"
arch=('x86_64' 'i386')
license=('MIT')
provides=('qrcp')
conflicts=('qrcp-git' 'qr-filetransfer-git' 'qrcp')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_x86_64.tar.gz")
source_i386=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_i386.tar.gz")
sha256sums_x86_64=(b303b95b6dc9163654708eb825523777064d1691e228650629090f7bb3fbb830)
sha256sums_i386=(bbe724acb5451433a398b6ffb0f4b795d5b20def169ddb063aa76918d1656177)


build() {
  ./qrcp completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/qrcp
  ./qrcp completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_qrcp
  ./qrcp completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/qrcp.fish
}

package() {
 install -Dm755 qrcp "$pkgdir/usr/bin/qrcp"
 cp -r share/ "$pkgdir/usr"
 install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
