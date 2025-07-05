pkgname="sunfalo"
pkgver=0.1.1
pkgrel=1
pkgdesc="Automatic screen color temperature daemon for Hyprland using hyprsunset"
url="https://codeberg.org/tomkoid/sunfalo"
arch=('any')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tomkoid/sunfalo/archive/${pkgver}.tar.gz")
sha512sums=("ac39f6c070203342b667674519dbc65d275a0b07e4d09f0771a14618e01fecf5f808fa76cd53faceed56975ac73b6ff3ef86f64f9df9b9b53d385e361ec352ff")

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd $pkgname
  go build -o sunfalo .
}

package() {
  install -Dm755 "${pkgname}/sunfalo" "${pkgdir}/usr/bin/sunfalo"

  # example config
  install -Dm644 "${pkgname}/sunfalo.example.toml" "${pkgdir}/etc/default/sunfalo"
}
