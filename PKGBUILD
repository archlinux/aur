# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=yarr-git
_pkgname=yarr
pkgver=v1.3.r0.g0916f11
pkgrel=1
pkgdesc="yet another rss reader."
arch=('i686' 'x86_64')
url='https://github.com/nkanaev/yarr'
license=('MIT')
source=('git+git://github.com/nkanaev/yarr' 'git+git://github.com/nkanaev/gofeed')
depends=()
makedepends=('go' 'make' 'git')
sha1sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir"
  mv "gofeed" "$_pkgname"
}

build(){
  cd "$srcdir/$_pkgname"
  make build_linux
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 '_output/linux/yarr' "$pkgdir/usr/bin/yarr"
}
