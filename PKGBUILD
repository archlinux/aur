# Maintainer: @aardbol
pkgname=upcloud-cli-community-bin
_pkgname=upcloud-cli
pkgver=3.37.2.community
# Upstream tags/versions carry a hyphen suffix (v3.37.1-community), which is
# illegal in pkgver; encode it as a trailing dot segment instead. _tag_suffix
# opts this package into suffix-aware tracking in scripts/update.sh.
_tag_suffix=-community
_pkgver=${pkgver%.*}${_tag_suffix}
pkgrel=1
pkgdesc='Community fork of upctl, the UpCloud command line client'
arch=('x86_64' 'aarch64')
url='https://github.com/upcloud-tools/upcloud-cli'
license=('MIT')
provides=('upcloud-cli')
conflicts=('upcloud-cli' 'upcloud-cli-git')
depends=('ca-certificates')
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('1ef5afab4d11b514f5cb11f9516217711349f99536f2bc1c41b137a563a6c0db')
sha256sums_aarch64=('bfa3f9a40d0c2c3f628b45d40693a60e7efdce229ffd83d0e7601c13fd9e13f6')

package() {
    install -Dm755 upctl "$pkgdir/usr/bin/upctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    "$pkgdir/usr/bin/upctl" completion bash > "$srcdir/upctl.bash"
    "$pkgdir/usr/bin/upctl" completion zsh > "$srcdir/_upctl"
    "$pkgdir/usr/bin/upctl" completion fish > "$srcdir/upctl.fish"
    install -Dm644 "$srcdir/upctl.bash" "$pkgdir/usr/share/bash-completion/completions/upctl"
    install -Dm644 "$srcdir/_upctl" "$pkgdir/usr/share/zsh/site-functions/_upctl"
    install -Dm644 "$srcdir/upctl.fish" "$pkgdir/usr/share/fish/vendor_completions.d/upctl.fish"
}
