# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=go-chromecast-git
_pkgname=go-chromecast
pkgver=0.3.1.r0.g21976a4
pkgrel=1
pkgdesc='Implements a basic number of the google chromecast commands.'
arch=('any')
url="https://github.com/vishen/$_pkgname"
license=('Apache2.0')
makedepends=('go' 'git')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  go build ./
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
