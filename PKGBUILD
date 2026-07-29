# Maintainer: edaywalid <becharwalid9@gmail.com>
# Source build of undo (https://github.com/edaywalid/undo).
pkgname=undo-cli
pkgver=0.2.8
pkgrel=1
pkgdesc="Revert what the last shell command did to the filesystem"
arch=('x86_64' 'aarch64')
url="https://github.com/edaywalid/undo"
license=('MIT')
depends=('glibc')
makedepends=('go' 'gcc' 'git')
optdepends=('zsh: zsh hook' 'bash: bash hook' 'fish: fish hook')
provides=('undo-cli')
conflicts=('undo-cli-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85b5d653b5c68ed9e34d23dcdfbcfed487cb6ca46c600c19d3e446326bad527b')

build() {
    cd "undo-$pkgver"
    export GOFLAGS="-mod=mod -trimpath"
    make VERSION="v$pkgver"
}

package() {
    cd "undo-$pkgver"
    install -Dm755 bin/undo "$pkgdir/usr/bin/undo"
    install -Dm755 build/libundo.so "$pkgdir/usr/lib/undo/libundo.so"
    install -Dm644 shell/undo.zsh "$pkgdir/usr/share/undo/undo.zsh"
    install -Dm644 shell/undo.bash "$pkgdir/usr/share/undo/undo.bash"
    install -Dm644 shell/undo.fish "$pkgdir/usr/share/undo/undo.fish"
    install -Dm644 completions/_undo "$pkgdir/usr/share/zsh/site-functions/_undo"
    install -Dm644 completions/undo.bash "$pkgdir/usr/share/bash-completion/completions/undo"
    install -Dm644 completions/undo.fish "$pkgdir/usr/share/fish/vendor_completions.d/undo.fish"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
