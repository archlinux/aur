# Maintainer: Truong Vu <wanwan.vxt@gmail.com>

pkgname=thaimeleon
pkgver=0.1.2
pkgrel=2
pkgdesc='Automatically generate a color scheme from a wallpaper'
arch=('x86_64')
url='https://codeberg.org/thairanaru/thaimeleon'
license=('AGPL-3.0-or-later')

depends=(
    'glibc'
    'libgcc'
)
makedepends=(
    'git'
    'cargo'
)

source=("$pkgname::git+https://codeberg.org/thairanaru/thaimeleon.git#tag=v$pkgver")
sha256sums=('9da535b0230858faffe2f25b74d9aa91cc14ed8e8873509eaf900d17d5c226f3')

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 'target/release/thaimeleon' -t "$pkgdir/usr/bin"
    install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname"
}
