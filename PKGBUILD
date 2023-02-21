# Maintainer: a13xie <rostik.medved@gmail.com>
pkgname=flamenco-worker
pkgver=3.2
pkgrel=1
pkgdesc="Worker for Blender's Flamenco Render System"
arch=('x86_64' 'aarch64')
url="https://projects.blender.org/studio/flamenco"
options=(!lto)
license=('GPL3')
depends=(
  'ffmpeg'
)
makedepends=(
	'go'
)
source=("${pkgname}::git+https://projects.blender.org/studio/flamenco.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname"
  make flamenco-worker
}

package() {
  install "$srcdir/$pkgname/flamenco-worker" -Dt "$pkgdir/usr/bin"
}
