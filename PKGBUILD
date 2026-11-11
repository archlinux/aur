# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=subview-nightly-bin
provides=('subview')
conflicts=('subview' 'subview-bin')
pkgver=0.2.0+nightly+20261111+1+g3770ea00
pkgrel=1
pkgdesc="Display a subtitle stream from stdin as a desktop overlay — nightly build"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/subview"
license=('MIT')

_source_base="${url}/releases/download/nightly"

# 同 aur/PKGBUILD：nightly 资产同样是滚动覆盖且文件名不含版本号，
# 本地文件名带上 pkgver（含日期+提交数+sha）可避免复用旧缓存。
source_x86_64=("subview-${pkgver}-x86_64-linux-gnu.tar.gz::${_source_base}/subview-x86_64-linux-gnu.tar.gz")
source_aarch64=("subview-${pkgver}-aarch64-linux-gnu.tar.gz::${_source_base}/subview-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    tar xzf "subview-${pkgver}-${CARCH}-linux-gnu.tar.gz"
    install -Dm755 "subview-${CARCH}-linux-gnu/subview" "$pkgdir/usr/bin/subview"
    install -Dm644 "subview-${CARCH}-linux-gnu/complete/subview.bash" "$pkgdir/usr/share/bash-completion/completions/subview" 2>/dev/null || true
    install -Dm644 "subview-${CARCH}-linux-gnu/complete/_subview" "$pkgdir/usr/share/zsh/site-functions/_subview" 2>/dev/null || true
    install -Dm644 "subview-${CARCH}-linux-gnu/complete/subview.fish" "$pkgdir/usr/share/fish/vendor_completions.d/subview.fish" 2>/dev/null || true
    install -Dm644 "subview-${CARCH}-linux-gnu/man/subview.1" "$pkgdir/usr/share/man/man1/subview.1" 2>/dev/null || true
}
