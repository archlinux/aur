# Maintainer: ~grassblock <i [at] gb0 [dot] dev>

pkgname=xsz
pkgver=0.4.2
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
sha256sums=('681de4ef78eb1733b7f3be2f31a35720f263243a60a394df8a4212275477f31c')
b2sums=('676a28fbbff117c58f3d917db5ecd67ab0b27c0cfa47bcf80a5988b194f092f3a8a7b1f2429b5f369e68d75e98f0453b7df217b7dabf62d0367304abf8a3cd81')

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
