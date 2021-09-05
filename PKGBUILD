# Maintainer: Luke Arms <luke@arms.to>

pkgname=timer-for-harvest
pkgver=0.3.7
pkgrel=1
pkgdesc="Harvest client implemented using GTK+ and Rust"
url="https://github.com/frenkel/timer-for-harvest"
arch=(x86_64)
license=(BSD-2)
depends=(gtk3)
makedepends=(cargo git rust)
_commit=a399dbbb629690c93a15b6c9ab7f16efb0fdf322 # tag/v0.3.7
source=(
    "git+https://github.com/frenkel/timer-for-harvest.git#commit=${_commit}"
    allow_resize.patch
)
sha256sums=(
    SKIP
    8c7e40b9fab97709ff460856ad96bd1eab8496bb50acb990e010a03e75f8b06d
)

prepare() {
    cd "$pkgname"
    patch -p1 -i "$srcdir/allow_resize.patch"
}

build() {
    return 0
}

package() {
    cd "$pkgname"
    cargo install --no-track --locked --root "$pkgdir/usr" --path .
    install -Dm 00755 -t "$pkgdir/usr/bin" target/release/timer-for-harvest
    install -Dm 00644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -Dm 00644 -t "$pkgdir/usr/share/applications" assets/timer-for-harvest.desktop
}
