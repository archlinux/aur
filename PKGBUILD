# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: fatalis <fatalis@fatalis.pw>

pkgname=lzbench
pkgver=2.2
pkgrel=1
pkgdesc='An in-memory benchmark of open-source compressors'
arch=('aarch64' 'armv7h' 'riscv64' 'x86_64')
url='https://github.com/inikep/lzbench'
license=(
    '0BSD'
    'Apache-2.0'
    'BSD-2-Clause'
    'BSD-3-Clause'
    'CC0-1.0'
    'CDDL-1.0'
    'GPL-1.0-or-later'
    'GPL-2.0-only'
    'GPL-2.0-or-later'
    'GPL-3.0-only'
    'GPL-3.0-or-later'
    'LGPL-2.1-or-later'
    'LGPL-3.0-or-later'
    'MIT'
    'Unlicense'
    'Zlib'
    'LicenseRef-bzip2-1.0.6'
)
depends=('glibc' 'gcc-libs')
makedepends=('gcc' 'cargo' 'chrpath')
source=("$pkgname-$pkgver.tar.gz::https://github.com/inikep/lzbench/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('69389958cb2016a1dbbd462fff603057339d772902b055b8299f6759f1f9a8cbadf31489254bb93f967ca6863e2db32e8da8bfe429cf5dfc4a4b61280164f4e5')

build() {
    cd $pkgname-$pkgver
    make USER_CFLAGS="$CFLAGS" USER_CXXFLAGS="$CXXFLAGS" USER_LDFLAGS="$LDFLAGS"
    chrpath -r '/usr/lib' lzbench
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 lzbench "$pkgdir/usr/bin/lzbench"
    install -Dm755 misc/density/src/target/release/libdensity_rs.so "$pkgdir/usr/lib/libdensity_rs.so"

    install -Dm644 doc/lzbench.7.txt "$pkgdir/usr/share/man/man7/lzbench.7"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 bwt/bzip2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/bzip2-LICENSE"
    install -Dm644 lz/brieflz/LICENSE "$pkgdir/usr/share/licenses/$pkgname/brieflz-LICENSE"
    install -Dm644 lz/brotli/LICENSE "$pkgdir/usr/share/licenses/$pkgname/brotli-LICENSE"
    install -Dm644 lz/fast-lzma2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/fast-lzma2-LICENSE"
    install -Dm644 lz/gipfeli/COPYING "$pkgdir/usr/share/licenses/$pkgname/gipfeli-COPYING"
    install -Dm644 lz/libdeflate/COPYING "$pkgdir/usr/share/licenses/$pkgname/libdeflate-COPYING"
    install -Dm644 lz/lizard/LICENSE "$pkgdir/usr/share/licenses/$pkgname/lizard-LICENSE"
    install -Dm644 lz/lz4/lib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/lz4-LICENSE"
    install -Dm644 lz/lzav/LICENSE "$pkgdir/usr/share/licenses/$pkgname/lzav-LICENSE"
    install -Dm644 lz/lzfse/LICENSE "$pkgdir/usr/share/licenses/$pkgname/lzfse-LICENSE"
    install -Dm644 lz/lzsse/LICENSE "$pkgdir/usr/share/licenses/$pkgname/lzsse-LICENSE"
    install -Dm644 lz/snappy/COPYING "$pkgdir/usr/share/licenses/$pkgname/snappy-COPYING"
    install -Dm644 lz/zstd/LICENSE "$pkgdir/usr/share/licenses/$pkgname/zstd-LICENSE"
    install -Dm644 lz/xz/COPYING.0BSD "$pkgdir/usr/share/licenses/$pkgname/xz-COPYING.0BSD"
    install -Dm644 lz/lzlib/COPYING "$pkgdir/usr/share/licenses/$pkgname/lzlib-COPYING"
    install -Dm644 lz/slz/LICENSE "$pkgdir/usr/share/licenses/$pkgname/slz-LICENSE"
    install -Dm644 lz/zlib/LICENSE "$pkgdir/usr/share/licenses/$pkgname/zlib-LICENSE"
    install -Dm644 lz/zlib-ng/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/zlib-ng-LICENSE"
    install -Dm644 misc/density/src/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/density-LICENSE-MIT"
    install -Dm644 misc/zpaq/COPYING "$pkgdir/usr/share/licenses/$pkgname/zpaq-COPYING"
}
