# Maintainer: Alyxia Sother <yrkvfbgu2005@tznvy.pbz(rot13)>
_pkgname='discordo'
pkgname='discordo-git'
pkgdesc='A lightweight and feature-rich terminal-based Discord client'
url="https://github.com/rigormorrtiss/$_pkgname/"
license=('MIT')
pkgver=r119.795d557
pkgrel=1
source=("git+https://github.com/rigormorrtiss/$_pkgname.git")
md5sums=('SKIP')
provides=('discordo')
depends=('glibc')
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
