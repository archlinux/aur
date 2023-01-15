# Maintainer: Daniel Souza <aur at posix dot dev dot br>

pkgname=yarr-git
_pkgname=yarr
pkgver=v2.3.r27.g91da774
pkgrel=3
pkgdesc="yet another rss reader."
arch=('i686' 'x86_64')
url='https://github.com/nkanaev/yarr'
license=('MIT')
source=('git+https://github.com/nkanaev/yarr')
depends=()
makedepends=('go' 'make' 'git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "$_pkgname"
  make build_linux
}

package() {
  cd "$_pkgname"
  install -Dm755 '_output/linux/yarr' "$pkgdir/usr/bin/yarr"
}
