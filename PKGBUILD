# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=i3keys
pkgver=0.0.16
pkgrel=1
pkgdesc='Lists used and unused keys in your i3wm or Sway config'
arch=('x86_64')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
options=(!lto)
depends=('libx11')
makedepends=('go' 'libxtst')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RasmusLindroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7169e9e75baff083555e581808a073a7b05959d2c75ff021118b71b3e8ce7787')

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o .
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
