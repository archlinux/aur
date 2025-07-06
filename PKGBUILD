pkgname="sunfalo"
pkgver=0.2.0
pkgrel=1
pkgdesc="Automatic screen color temperature daemon for Hyprland using hyprsunset"
url="https://codeberg.org/tomkoid/sunfalo"
arch=('any')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tomkoid/sunfalo/archive/${pkgver}.tar.gz")
sha512sums=("8b87d3406d795ad985a54855522865e3f03caa3a4f18fe7b3e827e64de2f2a15304c9e32f9c6c31e76daf32c7af7cf10cd96cd845d15e42ba8dc1c642344fe29")

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
