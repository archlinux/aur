# Maintainer: crux <c-rrux@outlook.com>

pkgname=kursor
pkgver=4.0.0
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
sha256sums=('e0d0125064c5375fed00361cf820d03694f35de28441572d088fcb969f6e6ac5'
            'e0d0125064c5375fed00361cf820d03694f35de28441572d088fcb969f6e6ac5')

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
