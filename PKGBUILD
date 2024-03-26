# Maintainer: Adis Durakovic <aur@mail.adisdurakovic.com>
pkgname=resticity
pkgver=1.0.41
pkgrel=1
epoch=
pkgdesc="A frontend for restic"
arch=("any")
url="https://github.com/ad-on-is/resticity"
license=('GPL3')
groups=()
depends=(go nodejs npm pnpm restic webkit2gtk rclone openssh)
makedepends=()
checkdepends=()
optdepends=()
provides=(resticity)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('9425881487fb3edbe5910d1b8fd3a68ba83d7d096e69f9840046733e42a41191')
validpgpkeys=()

prepare() {
        cd "$pkgname-$pkgver"
        export GOPATH=/tmp/go
        export GOBIN=/tmp/go/bin
        go install github.com/wailsapp/wails/v2/cmd/wails@latest
}

build() {
        cd "$pkgname-$pkgver"
        export GOPATH=/tmp/go
        export GOBIN=/tmp/go/bin
        export PATH=$GOBIN:$PATH
        ./build.sh desktop $pkgver
}

check() {
        cd "$pkgname-$pkgver"
        
}

package() {
        cd "$pkgname-$pkgver"
        install -Dm755 --no-target-directory "build/bin/resticity" "${pkgdir}/usr/bin/${pkgname}"
        install -Dm755 --no-target-directory "packaging/io.github.ad_on_is.Resticity.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.ad_on_is.Resticity.png"
        install -Dm755 --no-target-directory "packaging/io.github.ad_on_is.Resticity.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
