# Maintainer: LJ <aur.lj at munally.com>

pkgname=hyprls-git
pkgver=0.13.0.r18.g56a5525
pkgrel=1
pkgdesc="A LSP server for Hyprland config files"
arch=('x86_64')
url="https://github.com/hyprland-community/hyprls"
license=('MIT')
optdepends=('hyprland')
makedepends=('git' 'go' 'just')
source=("git+$url" "git+https://github.com/hyprwm/hyprland-wiki.git")
b2sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/hyprls"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
