# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=chainsaw-bin
_pkgname=chainsaw
pkgver=0.2.14
pkgrel=1
pkgdesc='Declarative Kubernetes end-to-end testing framework (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kyverno/chainsaw'
license=('Apache-2.0')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'kyverno-chainsaw-bin')

_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base}/chainsaw_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base}/chainsaw_linux_arm64.tar.gz")
sha256sums_x86_64=('f2f4a3f9a541d65db12f5c910950758f7d56fae20ad5b1272cdc271c9568443e')
sha256sums_aarch64=('b6494b71e490ab825890fc12cc575de7f59bfa637d5cfe73c66987e4454e397c')

package() {
    install -Dm755 "$srcdir/chainsaw" "$pkgdir/usr/bin/chainsaw"
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    if [[ -f "$srcdir/README.md" ]]; then
        install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi

    "$srcdir/chainsaw" completion bash | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/bash-completion/completions/chainsaw"
    "$srcdir/chainsaw" completion zsh | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/zsh/site-functions/_chainsaw"
    "$srcdir/chainsaw" completion fish | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/fish/vendor_completions.d/chainsaw.fish"
}
