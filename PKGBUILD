# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=owncast-git
_pkgname=owncast
pkgver=0.0.12.8e43b9d
pkgrel=1
pkgdesc="Take control over your live stream video by running it yourself. Streaming + chat out of the box."
url='https://github.com/owncast/owncast'
arch=('any')
license=('MIT')
makedepends=('git' 'go')
depends=()
conflicts=('owncast')
source=("git+$url"
        "https://raw.githubusercontent.com/owncast/owncast/develop/LICENSE")
sha256sums=('SKIP'
            '8dc06e06bb8b508eafc95aa410d1e51f8804edeed93598b3ab1b3c0cee8b2022')

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${_pkgver}"
}

package() {
  cd "${_pkgname}"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
# vim: ft=sh ts=2 sw=2 et



