#Maintainer: Karl Wikström <boogrocha@sidus.io>
#Maintainer: William Leven <boogrocha@sidus.io>

_tag=v1.0.21
pkgname=boogrocha
pkgver=$_tag
pkgrel=1
pkgdesc="A lightweight, easy to use command-line application (bgc) for managing your group room bookings at Chalmers University of Technology"
arch=('x86_64')
conflicts=(bgc)
provides=(bgc)
url="https://github.com/sidusio/boogrocha"
license=("GPL3")
makedepends=(go)
source=($url/archive/$_tag.tar.gz)
sha256sums=('e017fe0212da76c217146190fe89b40e6a32569ea9d037a6018967bd469998e6')
# The name of the root directory of the tar.gz that Github
# automatically creates and which therefore will be extracted
_src="BooGroCha-${pkgver:1}"

build() {
    cd $_src
    # Build as per Go package guidelines
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      ./cmd/bgc
}

package() {
    install -Dm755 ./$_src/bgc "$pkgdir"/usr/bin/bgc
}
