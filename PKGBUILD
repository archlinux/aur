# Maintainer: Endg4me_ <tyman.pocht at gmail.com>
pkgname=lrcsnc
pkgver=0.1.0
pkgrel=1
pkgdesc="Player-agnostic (MPRIS) synced lyrics fetcher and displayer."
arch=('x86_64' 'aarch64')
url="https://github.com/Endg4meZer0/lrcsnc"
license=('MIT')
options=(!lto)
optdepends=(
    'kakasi: Japanese romanization'
)
makedepends=('go>=1.23')
backup=(
    'etc/lrcsnc/config.toml'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Endg4meZer0/lrcsnc/archive/v${pkgver}.tar.gz")
sha256sums=('5c0c91194db8105d8572204b8f3e82ff61a26e5f86fad4a7b353c346b9c32c70')

build() {
    export GOPATH="$srcdir"/gopath
    cd "$srcdir/$pkgname-$pkgver"
    make VERSION="v$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make VERSION="v$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}