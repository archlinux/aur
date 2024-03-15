# Maintainer: Adis Durakovic <aur@mail.adisdurakovic.com>
pkgname=resticity
pkgver=1.0.16
pkgrel=1
epoch=
pkgdesc="A frontend for restic"
arch=("any")
url="https://github.com/ad-on-is/resticity"
license=('GPL3')
groups=()
depends=(go nodejs npm pnpm restic webkit2gtk)
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
sha256sums=('51039b59acd24873f6ccb2fdf2fa27058be0d54664b0c1c59df0db6deeb516a5')
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
        install -Dm755 --no-target-directory "packaging/resticity.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
        install -Dm755 --no-target-directory "packaging/resticity.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
