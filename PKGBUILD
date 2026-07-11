# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

pkgname='jq.sh'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://gitlab.com/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq' 'moreutils')
makedepends=('getoptions-ng' 'yq')
checkdepends=('shellcheck' 'shellspec')
optdepends=('yq: Adds support for yq, xq and tomlq')
source=("$url/-/releases/v$pkgver/downloads/$pkgname-v$pkgver.tar.gz")
sha256sums=('c5eb151bcc9e17753c3754519262023a3db096843785ecb6b6c6d87ed238cdf5')

prepare() {
    cd "$pkgname-v$pkgver" || return
    ./configure --prefix=/usr
}

build() {
    cd "$pkgname-v$pkgver" || return
    make
}

check() {
    cd "$pkgname-v$pkgver" || return
    make check
}

package() {
    cd "$pkgname-v$pkgver" || return
    make DESTDIR="$pkgdir" install
}
