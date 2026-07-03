# Maintainer: ~grassblock <i [at] gb0 [dot] dev>

pkgname=xsz
pkgver=0.5.1
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
sha256sums=('b1578429da6bbf7abf1c125b751ce2285369d8a8b15de10bc415341676698e4b')
b2sums=('c56e7c9f66587fb015e1014fa45ce9a0ec6b944a161c9ce1b928a45bbced89ad391a038c97909d5b457c2066db6f6b76b6e07a78f2e19046e5c7ca360c59a532')

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
