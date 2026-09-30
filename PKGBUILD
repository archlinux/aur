# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=deref-nightly-bin
provides=('deref')
conflicts=('deref' 'deref-bin')
pkgver=0.1.1+nightly+20260930+0+g5a6ce9be
pkgrel=1
pkgdesc="Replace symbolic links with real files / directories — nightly build"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/deref"
license=('MIT')

_source_base="${url}/releases/download/nightly"

# 同 aur/PKGBUILD：nightly 资产同样是滚动覆盖且文件名不含版本号，
# 本地文件名带上 pkgver（含日期+提交数+sha）可避免复用旧缓存。
source_x86_64=("deref-${pkgver}-x86_64-linux-gnu.tar.gz::${_source_base}/deref-x86_64-linux-gnu.tar.gz")
source_aarch64=("deref-${pkgver}-aarch64-linux-gnu.tar.gz::${_source_base}/deref-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    tar xzf "deref-${pkgver}-${CARCH}-linux-gnu.tar.gz"
    install -Dm755 "deref-${CARCH}-linux-gnu/deref" "$pkgdir/usr/bin/deref"
    install -Dm644 "deref-${CARCH}-linux-gnu/complete/deref.bash" "$pkgdir/usr/share/bash-completion/completions/deref" 2>/dev/null || true
    install -Dm644 "deref-${CARCH}-linux-gnu/complete/_deref" "$pkgdir/usr/share/zsh/site-functions/_deref" 2>/dev/null || true
    install -Dm644 "deref-${CARCH}-linux-gnu/complete/deref.fish" "$pkgdir/usr/share/fish/vendor_completions.d/deref.fish" 2>/dev/null || true
    install -Dm644 "deref-${CARCH}-linux-gnu/man/deref.1" "$pkgdir/usr/share/man/man1/deref.1" 2>/dev/null || true
}
