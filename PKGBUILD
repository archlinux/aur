# Maintainer: Henil <henil2911 + aur at gmail <.> com>
pkgname=zellij-git
_pkgname=zellij
pkgver=r371.845478f
_pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Terminal Workspace (WIP)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.github.com/zellij-org/zellij"
license=('MIT')
groups=()
depends=()
makedepends=('rust' 'cargo' 'git' 'binaryen')
checkdepends=()
optdepends=()
provides=('zellij')
conflicts=('zellij')
options=()
source=("git+https://github.com/zellij-org/zellij")
sha256sums=(SKIP)

build() {
    cd "$srcdir/$_pkgname"
    bash ./build-all.sh
    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/share/zellij/layouts"
    mkdir -p "${pkgdir}/usr/share/zellij/plugins"
    mkdir -p "${pkgdir}/usr/share/doc/zellij"
    install -Dm755 target/release/zellij "${pkgdir}/usr/bin/zellij"
    install -Dm644 assets/layouts/* "${pkgdir}/usr/share/zellij/layouts/"
    install -Dm644 assets/plugins/* "${pkgdir}/usr/share/zellij/plugins/"
    install -Dm644 GOVERNANCE.md "${pkgdir}/usr/share/doc/zellij/GOVERNANCE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/zellij/README.md"
    install -Dm644 assets/completions/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij.bash"
    install -Dm644 assets/completions/zellij.fish "${pkgdir}/usr/share/fish/completions/zellij.fish"
    install -Dm644 assets/completions/_zellij "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
