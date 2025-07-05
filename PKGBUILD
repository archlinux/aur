pkgname="sunfalo"
pkgver=0.1.0
pkgrel=1
pkgdesc="Automatic screen color temperature daemon for Hyprland using hyprsunset"
url="https://codeberg.org/tomkoid/sunfalo"
arch=('any')
makedepends=("go")
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tomkoid/sunfalo/archive/${pkgver}.tar.gz")
sha512sums=("f7679b48a29baf545c6c505f53d6ffd04a34280aeb9e319ad9857459880a09dd4fa00474fb53d78280485e520a434dba2ee3ff935ef6786df2e6122cd0483b60")

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
}
