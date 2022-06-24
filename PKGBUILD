pkgname=svd2rust-git
pkgdesc='Generate Rust register maps (structs) from SVD files'
pkgrel=1
pkgver=0.24.0.r2.g298f1f9
arch=(i686 x86_64)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
url=https://github.com/rust-embedded/svd2rust
license=(Apache MIT)
makedepends=(rust)
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  cargo build --release
}

package() {
  cd ${pkgname%-git}
  install -D -m755 target/release/${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"
}
