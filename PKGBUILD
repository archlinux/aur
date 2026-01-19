# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cargo-mutants
pkgver=26.1.2
pkgrel=1
pkgdesc='Mutation testing for Rust'
url="https://github.com/sourcefrog/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(cargo
         gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so
# https://github.com/sourcefrog/cargo-mutants/issues/589
_archive="$pkgname-$pkgname-v$pkgver"
source=("$url/archive/$pkgname-v$pkgver/$_archive.tar.gz")
sha256sums=('5e95b99a1446bb3437b3d43b1bf904f535790f09ec0e50f4322371e73f474b8f')

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
