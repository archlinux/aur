# Maintainer: crux <c-rrux@outlook.com>

pkgname=kursor
pkgver=4.3.18
pkgrel=1
pkgdesc="Keyboard-driven mouse-cursor -- service (grid & glide-*) & cli (pos / click / move / moveto)"
arch=(x86_64)

_github_url=https://github.com/rruxx/$pkgname
_gitee_url=https://gitee.com/rrux/$pkgname
url="${_github_url} ${_gitee_url}"

license=('AGPL-3.0-or-later')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-bin")
install="$pkgname.install"
depends=('glibc' 'libcap')
makedepends=('cargo')

source=("${_github_url}/archive/refs/tags/v$pkgver.tar.gz"  # github
        "${_gitee_url}/archive/refs/tags/v$pkgver.tar.gz")  # gitee
sha256sums=('75cc969e799e6e2b27ec53ef3566d1c961f1ef844c28fcd3c57542aa6700feff'
            '75cc969e799e6e2b27ec53ef3566d1c961f1ef844c28fcd3c57542aa6700feff')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" \
        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "contrib/systemd/${pkgname}d.service" \
        "$pkgdir/usr/lib/systemd/system/${pkgname}d.service"
}
