# Maintainer: Jordan Wade <jordan@jwade.net>

pkgname=git-subtrac
pkgver=0.04
pkgrel=1
pkgdesc='Keep the content for your git submodules all in one place: the parent repo.'
arch=('x86_64')
url='https://github.com/apenwarr/git-subtrac'
license=('Apache')
depends=('git')
makedepends=('go')
conflicts=('git-subtrac-git')
source=("https://github.com/apenwarr/git-subtrac/archive/v${pkgver}.tar.gz")
sha256sums=('162baf3614e7ba0c6ccf2838acae4780bbf8e1795e8294d9a32ff32379125e27')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
