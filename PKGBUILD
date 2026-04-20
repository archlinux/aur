# Maintainer: Warren Wu <warrenweiwu04@gmail.com>
pkgname=bananatype
pkgver=0.0.6
pkgrel=1
pkgdesc="monkeytype in your terminal"
arch=('x86_64')
url="https://github.com/WarrenWu4/bananatype"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('d48f9193eedafe50ffbf6f5f87c123b3b44b900efe5603c5e91b9a811cf8c724')
options=('!strip')

build() {
    cd "$srcdir/$pkgname"

    go build \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -ldflags="-X 'bananas/pkg/resourcepath.Build=prod' -X 'main.Build=prod' -extldflags \"$LDFLAGS\"" \
        -o "$pkgname" .
}

package() {
    cd "$srcdir/$pkgname"
    
    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
