# Contributor: timescam <rex.ky.ng at gmail dot com>
# Maintainer: m8D2 <omui (at) proton mail (dot) com>

pkgname=zentile
pkgver=0.1.1
pkgrel=2
pkgdesc="On-demand tiling for Openbox, Xfce and other EWMH Complaint Window Managers."
arch=(x86_64)
url="https://github.com/blrsn/$pkgname"
license=(MIT)
depends=(go)
optdepends=('xorg-server: with EWMH Complaint Window Managers')
provides=(zentile)
conflicts=(bin32-zentile zentile-bin zentile-git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d6963f61884cac7233d4fdb2ec53e8d3ff146bd274829220b3d1d2bd449c7732')

prepare(){
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go get
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir"/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
