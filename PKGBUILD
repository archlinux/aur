# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=kopia-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.9.3
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kopia/kopia/'
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.deb")
source_armv7h=("https://github.com/kopia/kopia/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_armhf.deb")
sha256sums_x86_64=('262295c134ff48f157a8cc26f19baa9576221e8cd42e67b354b0752ef4a47520')
sha256sums_aarch64=('7d915cb94063c2efd5fb4a5d3e5ff4ae2fec70944932dfe6b72add35b62dbd32')
sha256sums_armv7h=('c78d646528c161d14b3ff6794d651d0edfd245109d9c732a01b8c2d2400491f1')

package() {
    tar -xf data.tar.gz -C "$pkgdir"
    "$pkgdir/usr/bin/${pkgname%-bin}" --completion-script-bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
    "$pkgdir/usr/bin/${pkgname%-bin}" --completion-script-zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
}
