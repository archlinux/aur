# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cargo-mutants
pkgver=26.2.0
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
sha256sums=('b324cb4f4efddc3f772aa7f3d39d6357a0dc0a4611dba4b0b23f173586040c16')

prepare() {
    cd "$_archive"
    cargo fetch --locked --target host-tuple
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
