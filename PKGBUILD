# Maintainer: Nicholas Georgescu <nsg27@case.edu>

pkgname=traytimer
pkgver=1.0.0
pkgrel=1
pkgdesc="Tiny system tray utility with countdowns and stopwatches, with desktop notifications"
arch=('x86_64')
url="https://github.com/intekhabrizvi/traytimer"
license=('MIT')
depends=('gtk3' 'libayatana-appindicator' 'libnotify')
optdepends=('kdialog: notification popups under KDE')
makedepends=('go')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/intekhabrizvi/traytimer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7414a352712885fbb30aa957396eaad4d9d3b66faa5c46504c62b10fc1ec8759')

build() {
    cd "$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o traytimer .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 traytimer "$pkgdir/usr/bin/traytimer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
