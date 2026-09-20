# Maintainer: ~grassblock <i [at] gb0 [dot] dev>

pkgname=xsz
pkgver=0.5.3
pkgrel=1
pkgdesc="a compsize rewrite with multithread support"
url="https://github.com/SaltyKitkat/xsz"
arch=(x86_64)
license=(GPL-2.0)
provides=(xsz)
replaces=(xsz)
conflicts=(xsz)
depends=(libgcc # libgcc_s.so
         glibc # libc.so libm.so
         )
makedepends=(cargo)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1e9c26149e1a5396cb4173b49b42eb5149af71c5306ac05f3045b0a6d22461b8')
b2sums=('ab622f13c37497c1e57f5c5a602d6574376519248a322666fb2869ea27640097ab42358322d59def4204e26c6546e8162e80fafa8e18586e1e3d742688542a74')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS+=' -ffat-lto-objects'
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}


package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
