# Maintainer: Struan Robertson <struanrobertson@protonmail.com>

pkgname=grimblast-git
pkgver=37c8121
pkgrel=1
pkgdesc="A helper for screenshots within Hyprland."
arch=("any")
url="https://github.com/hyprwm/contrib"
licence=('MIT')
provides=('grimblast')
conflicts=('grimblast')
depends=("hyprland" "grim" "slurp" "jq")
optdepends=('libnotify: Notify users when a screenshot is taken'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc" "git")
source=("git+https://github.com/hyprwm/contrib.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/contrib/grimblast"
  git log --pretty="format:%h" -n 1 grimblast | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/contrib/grimblast"
  scdoc < grimblast.1.scd > grimblast.1
}

package() {
  cd "$srcdir/contrib/grimblast"
  
  install -Dm 644 grimblast.1 "$pkgdir/usr/share/man/man1/grimblast.1"
  install -Dm 755 grimblast "$pkgdir/usr/bin/grimblast"
}