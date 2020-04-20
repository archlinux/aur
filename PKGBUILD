# Maintainer: JustKidding <jk@vin.ovh>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=compiler-rt-headers
_pkgname=compiler-rt
pkgver=10.0.0
pkgrel=2
pkgdesc="Compiler runtime headers for clang"
arch=('x86_64')
url="https://compiler-rt.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$_pkgname-$pkgver.src.tar.xz{,.sig})
sha256sums=('6a7da64d3a0a7320577b68b9ca4933bdcab676e898b759850e827333c3282c75'
            'SKIP')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/$_pkgname-$pkgver.src"
  mkdir build
}

build() {
  cd "$srcdir/$_pkgname-$pkgver.src/build"

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
}

package() {
  cd "$srcdir/$_pkgname-$pkgver.src/build"

  cmake --install include
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
