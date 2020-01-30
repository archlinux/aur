# Maintainer: droserasprout <droserasprout@tuta.io>
pkgname=unflac
pkgrel=1
pkgver=r55.0ed8af0
pkgdesc='A command line tool for fast frame accurate audio image + cue sheet splitting.'
arch=('x86_64')
url="https://github.com/ftrvxmtrx/$pkgname"
license=('unknown')
makedepends=('go-pie' 'git')
depends=('ffmpeg')
source=('git+https://github.com/ftrvxmtrx/unflac')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $pkgname
  go get -u
  go build
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}