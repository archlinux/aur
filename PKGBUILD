pkgname="blokator"
pkgver=0.5.3
pkgrel=1
pkgdesc="Simple system-wide adblocker"
url="https://codeberg.org/Tomkoid/blokator"
arch=("x86_64")
makedepends=("cargo" "git" "pkg-config" "openssl")
optdepends=("android-tools: push hosts file to your Android device")
license=("GPL3")
source=("git+https://codeberg.org/Tomkoid/blokator#tag=$pkgver")
sha512sums=("SKIP")

build() {
  cd "$srcdir/blokator"
  # Prepare man page
  cp man-pages/blokator man-pages/blokator.1
  gzip man-pages/blokator.1

  # Build
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/blokator/target/release/blokator" "${pkgdir}/usr/bin/blokator"
  install -Dm644 "${srcdir}/blokator/man-pages/blokator.1.gz" "${pkgdir}/usr/share/man/man1/blokator.1.gz"
}
