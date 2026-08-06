# Maintainer: crux <c-rrux@outlook.com>

pkgname=kursor
pkgver=4.3.6
pkgrel=1
pkgdesc="Keyboard-driven mouse-cursor -- glide-num & glide-alpha (navigation) & grid (progressive targeting)"
arch=(x86_64)
url="https://github.com/rruxx/$pkgname https://gitee.com/rrux/$pkgname"
license=('AGPL-3.0-or-later')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-bin")
install="$pkgname.install"
depends=('glibc' 'libcap')
makedepends=('cargo')
source=("${url% *}/archive/refs/tags/v$pkgver.tar.gz"   # github
        "${url#* }/archive/refs/tags/v$pkgver.tar.gz")  # gitee
sha256sums=('b809fd89538456c4f7eafdf0ebd57b2050f8f23286c52fc0e804d2b05fc87d45'
            'b809fd89538456c4f7eafdf0ebd57b2050f8f23286c52fc0e804d2b05fc87d45')

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
