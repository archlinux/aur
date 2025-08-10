# Maintainer: xeyossr
# Description: 🚀 Terminalde Türkçe altyazılı anime arama ve izleme aracı
pkgname=anitr-cli
pkgver=4.3.3
pkgrel=1
pkgdesc="🚀 Terminalde Türkçe altyazılı anime arama ve izleme aracı"
arch=('any')
url="https://github.com/xeyossr/anitr-cli"
license=('GPL3')
depends=('mpv')
makedepends=('go' 'git')

optdepends=(
    'rofi: X11 kullanıcıları için GUI'
    'rofi-wayland: Wayland kullanıcıları için GUI'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xeyossr/anitr-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    gobuildenv=$(go version)
    cd "$srcdir/$pkgname-$pkgver"
    go build -o build/anitr-cli -ldflags="-X 'github.com/xeyossr/anitr-cli/internal/update.version=${pkgver}' -X 'github.com/xeyossr/anitr-cli/internal/update.buildEnv=${gobuildenv}'"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 build/anitr-cli "${pkgdir}/usr/bin/${pkgname}"
}