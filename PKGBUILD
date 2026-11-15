# Maintainer: @aardbol
pkgname=upcloud-cli-community-bin
_pkgname=upcloud-cli
pkgver=3.37.1.community
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

sha256sums_x86_64=('280d0899baacb6e45c9068bdaf856394ed891330b504cacf1a63d9cae2a381d8')
sha256sums_aarch64=('9210513e15ec7745170e5e47daf40060446fe7f06fb4643c658c1f426880bc7d')

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