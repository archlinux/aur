# Maintainer: Jerry Reinoehl <jerryreinoehl@gmail.com>
pkgname=aarch64-linux-musl-cross-bin
pkgver=11.2.1
pkgrel=3
pkgdesc="Static musl-based cross-compilation toolchain provided by musl.cc"
arch=("x86_64" "i686")
url="https://musl.cc/"
license=("MIT")
options=(!strip staticlibs)
source_x86_64=(
  "https://more.musl.cc/$pkgver/x86_64-linux-musl/aarch64-linux-musl-cross.tgz"
)
source_i686=(
  "https://more.musl.cc/$pkgver/i686-linux-musl/aarch64-linux-musl-cross.tgz"
)
sha256sums_x86_64=(
  "ef7257105c568e0e52e7f0bbcdd3819d9372774252483618d5066e47252431e5"
)
sha256sums_i686=(
  "c909817856d6ceda86aa510894fa3527eac7989f0ef6e87b5721c58737a06c38"
)

package() {
  local name=${pkgname%%-bin}

  mkdir -p "$pkgdir/usr/"
  cd "$srcdir/$name/"
  rm -rf share/man/man7 share/locale/ share/gcc-$pkgver/ usr

  # fix broken absolute link to /lib/libc.so
  ln -sfT ../lib/libc.so aarch64-linux-musl/lib/ld-musl-aarch64.so.1

  cp -r "./" "$pkgdir/usr/"
}
