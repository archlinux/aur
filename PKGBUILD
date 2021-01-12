# Maintainer: Henil <dedaniahenil@gmail.com>
pkgname=mosaic-git
_pkgname=mosaic
pkgver=v0.1.1.98e5e94
_pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Terminal Workspace (WIP)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/mosaic-org/mosaic"
license=('MIT')
groups=()
depends=()
makedepends=('rust' 'cargo' 'git')
checkdepends=()
optdepends=()
provides=('mosaic')
conflicts=('mosaic')
options=()
source=("git+https://github.com/mosaic-org/mosaic")
sha256sums=(SKIP)

build() {
    cd "$srcdir/$_pkgname"
    MOSAIC_VERSION=$pkgver cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/mosaic "${pkgdir}/usr/bin/mosaic"
    install -Dm644 assets/completions/mosaic.bash "${pkgdir}/usr/share/bash-completion/completions/mosaic.bash"
    install -Dm644 assets/completions/mosaic.fish "${pkgdir}/usr/share/fish/completions/mosaic.fish"
    install -Dm644 assets/completions/_mosaic "${pkgdir}/usr/share/zsh/site-functions/_mosaic"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "v$_pkgver.$pkgrel.$(git log -n1 --format="%h")"
}
