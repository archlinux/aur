# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=stow-cm-nightly-bin
conflicts=('stow-cm' 'stow-cm-bin')
provides=('stow-cm')
pkgver=0.29.0+nightly+20260929+0+g73bfd227
pkgrel=1
pkgdesc="Config manager (gnu-stow like) — nightly build"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/stow-cm"
license=('GPL2')

_source_base="${url}/releases/download/nightly"

# 同 aur/PKGBUILD：nightly 资产同样是滚动覆盖且文件名不含版本号，
# 本地文件名带上 pkgver（含日期+提交数+sha）可避免复用旧缓存。
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
