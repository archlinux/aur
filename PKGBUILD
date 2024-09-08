pkgname=hpaper
pkgver=0.1.0
pkgrel=1
pkgdesc='Automated Wallpaper Management for Hyprland Using Hyprpaper'
arch=('x86_64')
url="https://github.com/Hcode00/hpaper"
license=('GPL')
makedepends=('go')
depends=('hyprland>0' 'hyprpaper>0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2dc377a3d590dff77a7fef4e4514e22bab2050da66403c42a4d0e362b69dca82')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o $pkgname
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
