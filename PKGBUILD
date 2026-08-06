# Maintainer: crux <c-rrux@outlook.com>

pkgname=kursor
pkgver=3.1.4
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
sha256sums=('bed909db124319c4f92098123414b1a57d0069bf09cc5086f62a13793139c9e5'
            'bed909db124319c4f92098123414b1a57d0069bf09cc5086f62a13793139c9e5')

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
