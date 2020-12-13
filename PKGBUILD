# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot-git
pkgver=v1.5.rc2.r34.g3520fd2c
pkgrel=1
pkgdesc="A helper for screenshots within sway."
arch=("x86_64")
url="https://github.com/swaywm/sway"
license=('MIT')
provides=('grimshot')
conflicts=('grimshot')
replaces=('swaygrab')
depends=("sway" "grim" "slurp" "jq" "xdg-user-dirs" "git")
optdepends=('libnotify: Notify users when a screenshot is taken'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc")
source=("git+https://github.com/swaywm/sway.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sway/contrib"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/sway/contrib"
  scdoc < grimshot.1.scd > grimshot.1
}

package() {
  cd "$srcdir/sway/contrib"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -Dm 755 grimshot "$pkgdir/usr/bin/grimshot"
}
