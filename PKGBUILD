# Maintainer: crux <c-rrux@outlook.com>

pkgname=kursor
pkgver=3.1.3
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
sha256sums=('fee8f96d8e9a26a7e8470c504b861519e5e114327ad7f1ecd1d59b4dbb7a701e'
            'fee8f96d8e9a26a7e8470c504b861519e5e114327ad7f1ecd1d59b4dbb7a701e')

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
