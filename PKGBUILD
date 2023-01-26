# Maintainer: coffebar i8ehkvien@mozmail.com

pkgname=intel_backlight_brightness_step
pkgver=0.1
pkgrel=1
pkgdesc='Fix tiny brightness step for fn keys on intel-core laptops'
arch=('x86_64')
url="https://github.com/coffebar/$pkgname"
license=('GPL')
makedepends=(git go)
_commit=21db97de589a24b233946105715498cffd327ce6
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver(){
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname $pkgname.go
}

# check() {
#   cd "$pkgname"
# }

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
