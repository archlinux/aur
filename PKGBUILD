# Maintainer: ManiacTwister <aur@maniactwister.de>
pkgname=tunneller-git
pkgver=release.0.6.r7.gf02ebdb
pkgrel=1
pkgdesc='Tunneller allows you to expose services which are running on localhost, or on your local network, to the public internet.'
arch=('x86_64')
url='https://github.com/skx/tunneller'
license=('GPL')
makedepends=('git' 'go-pie')
source=("$pkgname::git+https://github.com/skx/tunneller.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o tunneller .
}

package() {
  cd $pkgname
  install -Dm755 tunneller  "$pkgdir"/usr/bin/tunneller
}

