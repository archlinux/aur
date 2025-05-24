# Maintainer: al-ce <23170004+al-ce@users.noreply.github.com>
_pkgname=terminal-yt-git
pkgname=terminal-yt-git
pkgver=2.0.5.r1.gcd8501d
pkgrel=1
pkgdesc="A small newsboat-inspired terminal YouTube subscription manager written in Rust"
arch=('x86_64')
url="https://github.com/jooooscha/terminal-yt"
license=('GPL3')
depends=('mpv')
makedepends=('git' 'rust' 'cargo')
provides=('terminal-yt')
conflicts=('terminal-yt')
source=("$pkgname::git+https://github.com/jooooscha/terminal-yt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$srcdir/$_pkgname"
    cargo fetch
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --frozen
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "target/release/tyt" "$pkgdir/usr/bin/tyt"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
