# Maintainer: Alyxia Sother <yrkvfbgu2005@tznvy.pbz(rot13)>
_pkgname='discordo'
pkgname='discordo-git'
pkgdesc='A lightweight and feature-rich terminal-based Discord client'
url="https://github.com/ayntgl/$_pkgname/"
license=('MIT')
pkgver=r119.795d557
pkgrel=2
source=("git+https://github.com/ayntgl/$_pkgname.git")
md5sums=('SKIP')
provides=('discordo')
conflicts=('discordo')
optdepends=('xclip: clipboard support for X11'
            'wl-clipboard: clipboard support for Wayland')
makedepends=('go' 'git')
arch=('x86_64')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
 cd $srcdir/$_pkgname
 go build
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
