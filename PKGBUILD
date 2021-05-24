# Maintainer: Popolon <popolon@popolon.org>

pkgname=editinteractivesvg
_pkgname=editInteractiveSVG
pkgrel=1
pkgver=1.2.0
pkgdesc="Create interactive SVG illustrations"
url="https://mothsart.github.io/editeur-svg-interactif.html"
arch=('x86_64' 'i686' 'armv7' 'aarch64' 'riscv32' 'riscv64')
license=("BSD")
depends=('semver')
makedepends=('make' 'semver')

source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/mothsART/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('5d25156cfd81ccf52e090b4680efe0ea75da2917e4324a8a83fe4064b1acee46')

build() {
    cd "${_pkgname}-${pkgver}"
    npm install
    make build
    make upgrade
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 debian/edit-interactive-svg.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm755 edit-interactive-svg "$pkgdir/usr/bin/edit-interactive-svg"
    install -Dm644 favicon.png index.html -t "$pkgdir/usr/share/applications/edit-interactive-svg"
    cp -a examples static "$pkgdir/usr/share/applications/edit-interactive-svg/"
}

