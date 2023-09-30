# Maintainer: Eumeryx <eumeryx@foxmail.com>

pkgname=(
  rust-std-i686-linux-android
  rust-std-x86_64-linux-android
  rust-std-aarch64-linux-android
  rust-std-arm-linux-androideabi
  rust-std-armv7-linux-androideabi
  rust-std-thumbv7neon-linux-androideabi
)
pkgbase=rust-std-android
epoch=1
pkgver=1.72.1
pkgrel=1
pkgdesc="Android targets for Rust"
arch=(x86_64)
url="https://www.rust-lang.org/"
license=(
  Apache
  MIT
)
options=(
  !debug
  !emptydirs
  !lto
  !strip
  !buildflags
)
depends=(
  rust=$epoch:$pkgver
)
makedepends=(
  'cmake'
  'ninja'
  'python'
  'android-ndk>=r25'  # If you already have android-ndk installed and `ndk-which` is in the PATH, then you can remove this dependency.
)
optdepends=(
  'android-ndk'
  'cargo-ndk'
)
conflicts=(rust-nightly)
source=(
  "https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.xz"
)
sha256sums=(
  'aea58d962ff1c19521b9f587aad88285f0fd35b6b6738b031a7a15bb1b70a7c3'
)

prepare() {
  cd rustc-$pkgver-src

  NDKTOOLCHAIN="$(dirname $(ndk-which ar))"

  cat >config.toml <<EOF
changelog-seen = 2

[build]
target = [
  "i686-linux-android",
  "x86_64-linux-android",
  "aarch64-linux-android",
  "arm-linux-androideabi",
  "armv7-linux-androideabi",
  "thumbv7neon-linux-androideabi",
]
cargo = "/usr/bin/cargo"
rustc = "/usr/bin/rustc"
rustfmt = "/usr/bin/rustfmt"
submodules = false
locked-deps = true
vendor = true
sanitizers = true
profiler = true
docs = false

[install]
prefix = "/usr"
libdir = "lib"

[rust]
codegen-units-std = 1
debuginfo-level-std = 2
channel = "stable"
rpath = false
backtrace-on-ice = true
remap-debuginfo = true
jemalloc = true

[dist]
compression-formats = ["gz"]

[target.i686-linux-android]
cc = "${NDKTOOLCHAIN}/i686-linux-android21-clang"
cxx = "${NDKTOOLCHAIN}/i686-linux-android21-clang++"
ar = "${NDKTOOLCHAIN}/llvm-ar"
ranlib = "${NDKTOOLCHAIN}/llvm-ranlib"

[target.x86_64-linux-android]
cc = "${NDKTOOLCHAIN}/x86_64-linux-android21-clang"
cxx = "${NDKTOOLCHAIN}/x86_64-linux-android21-clang++"
ar = "${NDKTOOLCHAIN}/llvm-ar"
ranlib = "${NDKTOOLCHAIN}/llvm-ranlib"

[target.aarch64-linux-android]
cc = "${NDKTOOLCHAIN}/aarch64-linux-android21-clang"
cxx = "${NDKTOOLCHAIN}/aarch64-linux-android21-clang++"
ar = "${NDKTOOLCHAIN}/llvm-ar"
ranlib = "${NDKTOOLCHAIN}/llvm-ranlib"

[target.arm-linux-androideabi]
cc = "${NDKTOOLCHAIN}/armv7a-linux-androideabi21-clang"
cxx = "${NDKTOOLCHAIN}/armv7a-linux-androideabi21-clang++"
ar = "${NDKTOOLCHAIN}/llvm-ar"
ranlib = "${NDKTOOLCHAIN}/llvm-ranlib"

[target.armv7-linux-androideabi]
cc = "${NDKTOOLCHAIN}/armv7a-linux-androideabi21-clang"
cxx = "${NDKTOOLCHAIN}/armv7a-linux-androideabi21-clang++"
ar = "${NDKTOOLCHAIN}/llvm-ar"
ranlib = "${NDKTOOLCHAIN}/llvm-ranlib"

[target.thumbv7neon-linux-androideabi]
cc = "${NDKTOOLCHAIN}/armv7a-linux-androideabi21-clang"
cxx = "${NDKTOOLCHAIN}/armv7a-linux-androideabi21-clang++"
ar = "${NDKTOOLCHAIN}/llvm-ar"
ranlib = "${NDKTOOLCHAIN}/llvm-ranlib"
EOF
}

build() {
  cd rustc-$pkgver-src

  RUST_BACKTRACE=1 python ./x.py build library/std --stage 0 -j "$(nproc)"
}

package_rust-std-i686-linux-android() {
  pkgdesc="${pkgname#rust-std-*} target for the Rust standard library"

  cd rustc-$pkgver-src/build/host/stage0-sysroot/lib64/rustlib
  
  mkdir -p $pkgdir/usr/lib/rustlib/
  cp -pPRv ${pkgname#rust-std-*} $pkgdir/usr/lib/rustlib/

  mkdir -p $pkgdir/usr/share/licenses
  ln -s /usr/share/licenses/rust $pkgdir/usr/share/licenses/$pkgname
}


package_rust-std-x86_64-linux-android() {
  pkgdesc="${pkgname#rust-std-*} target for the Rust standard library"

  cd rustc-$pkgver-src/build/host/stage0-sysroot/lib64/rustlib
  
  mkdir -p $pkgdir/usr/lib/rustlib/
  cp -pPRv ${pkgname#rust-std-*} $pkgdir/usr/lib/rustlib/

  mkdir -p $pkgdir/usr/share/licenses
  ln -s /usr/share/licenses/rust $pkgdir/usr/share/licenses/$pkgname
}

package_rust-std-aarch64-linux-android() {
  pkgdesc="${pkgname#rust-std-*} target for the Rust standard library"

  cd rustc-$pkgver-src/build/host/stage0-sysroot/lib64/rustlib
  
  mkdir -p $pkgdir/usr/lib/rustlib/
  cp -pPRv ${pkgname#rust-std-*} $pkgdir/usr/lib/rustlib/

  mkdir -p $pkgdir/usr/share/licenses
  ln -s /usr/share/licenses/rust $pkgdir/usr/share/licenses/$pkgname
}

package_rust-std-arm-linux-androideabi() {
  pkgdesc="${pkgname#rust-std-*} target for the Rust standard library"

  cd rustc-$pkgver-src/build/host/stage0-sysroot/lib64/rustlib
  
  mkdir -p $pkgdir/usr/lib/rustlib/
  cp -pPRv ${pkgname#rust-std-*} $pkgdir/usr/lib/rustlib/

  mkdir -p $pkgdir/usr/share/licenses
  ln -s /usr/share/licenses/rust $pkgdir/usr/share/licenses/$pkgname
}

package_rust-std-armv7-linux-androideabi() {
  pkgdesc="${pkgname#rust-std-*} target for the Rust standard library"

  cd rustc-$pkgver-src/build/host/stage0-sysroot/lib64/rustlib
  
  mkdir -p $pkgdir/usr/lib/rustlib/
  cp -pPRv ${pkgname#rust-std-*} $pkgdir/usr/lib/rustlib/

  mkdir -p $pkgdir/usr/share/licenses
  ln -s /usr/share/licenses/rust $pkgdir/usr/share/licenses/$pkgname
}

package_rust-std-thumbv7neon-linux-androideabi() {
  pkgdesc="${pkgname#rust-std-*} target for the Rust standard library"

  cd rustc-$pkgver-src/build/host/stage0-sysroot/lib64/rustlib
  
  mkdir -p $pkgdir/usr/lib/rustlib/
  cp -pPRv ${pkgname#rust-std-*} $pkgdir/usr/lib/rustlib/

  mkdir -p $pkgdir/usr/share/licenses
  ln -s /usr/share/licenses/rust $pkgdir/usr/share/licenses/$pkgname
}
