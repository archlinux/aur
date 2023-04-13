# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname=qrcp-bin
pkgver=0.10.1
pkgrel=3
provides=("${pkgname/-bin/}")
conflicts=('qrcp' 'qrcp-git')
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
arch=('x86_64' 'i386' 'armv7h' 'aarch64')
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_x86_64.tar.gz")
source_i386=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/${pkgname/-bin/}_${pkgver}_linux_armv7h.tar.gz")

sha256sums_x86_64=('27b1f2b9004ecf967a4abe95bd324b99b4f077f0c627ad96ea16e18644dce26e')
sha256sums_i386=('27b1f2b9004ecf967a4abe95bd324b99b4f077f0c627ad96ea16e18644dce26e')
sha256sums_aarch64=('27b1f2b9004ecf967a4abe95bd324b99b4f077f0c627ad96ea16e18644dce26e')
sha256sums_armv7h=('27b1f2b9004ecf967a4abe95bd324b99b4f077f0c627ad96ea16e18644dce26e')

build() {
  ./qrcp completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/qrcp
  ./qrcp completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_qrcp
  ./qrcp completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/qrcp.fish
}

package() {
 install -Dm755 qrcp "$pkgdir/usr/bin/qrcp"
 cp -r share/ "$pkgdir/usr"
 install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}"
 install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname/-bin/}"
}
