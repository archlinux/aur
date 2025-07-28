# Maintainer: LJ <aur.lj at munally.com>

pkgname=hyprls-git
pkgver=0.8.0
pkgrel=1
pkgdesc="A LSP server for Hyprland config files"
arch=('x86_64')
url="https://github.com/hyprland-community/hyprls"
license=('MIT')
optdepends=('hyprland')
makedepends=('git' 'go' 'just')
source=("git+$url#tag=v$pkgver" "git+https://github.com/hyprwm/hyprland-wiki.git")
b2sums=('SKIP' 'SKIP')

prepare() {
    cd "$srcdir/hyprls"
    git submodule init
    git config submodule.hyprland-wiki.url "$srcdir/hyprland-wiki"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/hyprls"
    just build
}

package() {
      install -Dm755 "$srcdir/hyprls/hyprls" "$pkgdir/usr/bin/hyprls"
}
