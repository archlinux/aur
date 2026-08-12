# Maintainer: Sam Whited <sam@samwhited.com>

pkgname='tracklist'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Create text tracklists from Musicbrainz releases using templates'
arch=('x86_64')
url='https://codeberg.org/SamWhited/tracklist'
license=('custom')
makedepends=(
  'go'
)

source=(
  "${pkgname}_${pkgver}.zip::${url}/archive/v${pkgver}.zip"
)
sha256sums=('220e3782b6f50486e60230c0820b728e542cd2db3c19ab895de9ef6ed4affa72')

build() {
  cd tracklist/

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build .
}

package() {
  cd tracklist/
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
