# Maintainer: tee < teeaur at duck dot com >
_pkg=wasmcloud
pkgname=wasmcloud-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Build, manage, and scale Wasm apps across any cloud, K8s, or edge"
arch=(x86_64)
provides=($_pkg)
conflicts=($_pkg wash)
url="https://wasmcloud.com"
_src="https://github.com/wasmCloud/wasmCloud"
license=("Apache-2.0")
source=("$_src/raw/v$pkgver/LICENSE")
_exe="$pkgname-$arch-$pkgver"
source_x86_64=("$_exe::$_src/releases/download/v$pkgver/wash-x86_64-unknown-linux-gnu")
sha256sums=('0d7e475818c32a6bad4c0715b1f23848d7e3544774e7d92d4797e076d80f3e04')
sha256sums_x86_64=('8b54c5516737e918aabc61ccc80992c06b1feeda6069d3405c23b09ddff5f6a8')

package() {
    install -Dm755 "$_exe" "$pkgdir/usr/bin/wash"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    chmod +x "$_exe"
    install -Dm644 <(./$_exe completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/wash"
    install -Dm644 <(./$_exe completion elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/wash.elv"
    install -Dm644 <(./$_exe completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/wash.fish"
    install -Dm644 <(./$_exe completion zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_wash"
}
