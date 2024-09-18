pkgname=hpaper
pkgver=0.2.0
pkgrel=1
pkgdesc='Automated Wallpaper Management for Hyprland Using Hyprpaper'
arch=('x86_64')
url="https://github.com/Hcode00/hpaper"
license=('GPL')
makedepends=('go')
depends=('hyprland>0' 'hyprpaper>0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ed115d4d2e23a4b8ac577c283ef3127bc096f52bbac03d9f8ac915da787b371')

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
