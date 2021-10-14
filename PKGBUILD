# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=kopia-bin
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.9.1
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
sha256sums_x86_64=('bb7631bfea476578f11d282f0eb28a8af438bccac0aa114f67ce7a80c5b60284')
sha256sums_aarch64=('d903b87ed5df6f406e585e87579fc7a871dc3caafe75ecd20b4e2c3ad8756de5')
sha256sums_armv7h=('01e729063da74ffdcacbd2260c259f96e871ad2d466a8bd1eaafabfe19147ded')

package() {
    tar -xf data.tar.gz -C "$pkgdir"
    "$pkgdir/usr/bin/${pkgname%-bin}" --completion-script-bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
    "$pkgdir/usr/bin/${pkgname%-bin}" --completion-script-zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
}
