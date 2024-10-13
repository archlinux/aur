# Maintainer: Jerome Gravel-Niquet <jeromegn@gmail.com>

pkgname="savvy"
pkgver="0.16.0"
pkgrel="1"
pkgdesc="Command line tool for savvy services services"
arch=("x86_64")
url="https://getsavvy.so"
license=("MIT")
depends=()
provides=("savvy")
conflicts=("savvy-git")
source=("savvy::https://github.com/getsavvyinc/savvy-cli/releases/download/${pkgver}/savvy_linux_x86_64")
sha256sums=('043910a31e68edba91df60c6ee9af46e5e2af47931ee463f7b86f695ded775c8')

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
