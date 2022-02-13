# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=kopia-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.10.5
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
sha256sums_x86_64=('95b44ef7aed59d76a841568bde5a129de2934c27892e6fcfaba93b6c06b26528')
sha256sums_aarch64=('0eb2ad66ebf5fa8a4e14a00ed32957e06d7a3b04004dcbd54a4e0db42ed87d37')
sha256sums_armv7h=('23a07391d439151e01a784015c006676c06ddabc4c448cb1430f9a8ab6d14f30')

package() {
    tar -xf data.tar.gz -C "$pkgdir"
    "$pkgdir/usr/bin/${pkgname%-bin}" --completion-script-bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
    "$pkgdir/usr/bin/${pkgname%-bin}" --completion-script-zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
}
