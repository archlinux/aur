# Maintainer: Artem Trokhycmhuk <yuc44w68t at relay dot firefox dot com>
pkgname=noverify
pkgver=0.3.0
pkgrel=1
pkgdesc="Pretty fast linter (code static analysis utility) for PHP"
arch=(x86_64)
url="https://github.com/VKCOM/noverify"
license=('MIT')
makedepends=('go')
provides=(noverify)
conflicts=(noverify-bin noverify-git)
source=("https://github.com/VKCOM/noverify/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('282f59eb4704610fa3b78a3e55bbef148ade64ef3dd0fd4736e7870b56f1e35f')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p build/
}

build() {
    ls
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build 

}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname

}
