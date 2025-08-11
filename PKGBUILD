# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cargo-mutants
pkgver=25.3.1
pkgrel=1
pkgdesc='Mutation testing for Rust'
url="https://github.com/sourcefrog/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(cargo
         gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('56c8daaf8040cd02c997187386cf7da4074ffad185a99edba213487f87a86553')

prepare() {
    cd "$_archive"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_archive"
    cargo build --frozen --release
}

package() {
    cd "$_archive"
    install -Dm 755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
