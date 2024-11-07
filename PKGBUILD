# Maintainer: Blallo <blallo@autistici.org>

pkgname="savvy"
pkgver="0.20.0"
pkgrel="1"
pkgdesc="Command line tool for savvy services services"
arch=("x86_64")
url="https://getsavvy.so"
license=("MIT")
depends=()
provides=("savvy")
conflicts=("savvy-git")
source=("savvy::https://github.com/getsavvyinc/savvy-cli/releases/download/${pkgver}/savvy_linux_x86_64")
sha256sums=('2f62dc8670ff2f23227501cd541010f6818030abb9673fdf778ebbacc8be2d4f')

prepare() {
    mkdir -p completions
    chmod +x ./savvy
    ./savvy completion bash > completions/savvy
    ./savvy completion zsh > completions/_savvy
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    install -m755 savvy "$pkgdir/usr/bin"
    install -m644 completions/savvy "$pkgdir/usr/share/bash-completion/completions"
    install -m644 completions/_savvy "$pkgdir/usr/share/zsh/site-functions"
}
