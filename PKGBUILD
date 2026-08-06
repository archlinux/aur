# Maintainer: crux <c-rrux@outlook.com>

pkgname=kursor
pkgver=4.1.0
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
sha256sums=('d9cb498bb523117c3a22334770e3d051ab923012294ae05c83e926f822e537bf'
            'd9cb498bb523117c3a22334770e3d051ab923012294ae05c83e926f822e537bf')

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
