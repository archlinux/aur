#Maintainer: Karl Wikström <boogrocha@sidus.io>
#Maintainer: William Leven <boogrocha@sidus.io>

# _tag and sha256 is populated by the pipeline
_tag=v1.1.1
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
sha256sums=('0d749ae45939fd3fcfd58a4db9d04252f864545e01956db0d040db8b0bc04fc1')
# The name of the root directory of the tar.gz that Github
# automatically creates and which therefore will be extracted
_src="BooGroCha-${pkgver:1}"

build() {
    cd $_src
    # Build as per Go package guidelines
    # https://wiki.archlinux.org/index.php/Go_package_guidelines#Flags_and_build_options
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
