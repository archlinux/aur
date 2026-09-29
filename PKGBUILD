# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=stow-cm-bin
conflicts=('stow-cm')
provides=('stow-cm')
pkgver=0.29.0
pkgrel=1
pkgdesc="Config manager (gnu-stow like)"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/stow-cm"
license=('GPL2')

_source_base="${url}/releases/download/v${pkgver}"

# 下载到 SRCDEST 的本地文件名带上 pkgver：
# 上游资产名不含版本号，若沿用原名，makepkg 会静默复用上一次缓存的 tar.gz，
# 导致「包版本是新的、二进制是旧的」。文件名随 pkgver 变化可强制重新下载。
source_x86_64=("stow-cm-${pkgver}-x86_64-linux-gnu.tar.gz::${_source_base}/stow-cm-x86_64-linux-gnu.tar.gz")
source_aarch64=("stow-cm-${pkgver}-aarch64-linux-gnu.tar.gz::${_source_base}/stow-cm-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    tar xzf "stow-cm-${pkgver}-${CARCH}-linux-gnu.tar.gz"
    install -Dm755 "stow-cm-${CARCH}-linux-gnu/stow-cm" "$pkgdir/usr/bin/stow-cm"
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/complete/stow-cm.bash" "$pkgdir/usr/share/bash-completion/completions/stow-cm" 2>/dev/null || true
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/complete/_stow-cm" "$pkgdir/usr/share/zsh/site-functions/_stow-cm" 2>/dev/null || true
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/complete/stow-cm.fish" "$pkgdir/usr/share/fish/vendor_completions.d/stow-cm.fish" 2>/dev/null || true
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/man/stow-cm.1" "$pkgdir/usr/share/man/man1/stow-cm.1" 2>/dev/null || true
}
