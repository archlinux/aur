# Maintainer: kaolinite
# Contributor: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: BingBong
# Contributor: Alberto Salvia Novella (es20490446e.wordpress.com)
# Contributor: Bryan Malyn <bim9262@gmail.com>
# Contributor: Spider Mario <spidermario@free.fr>
# Contributor: Taras Shpot <mrshpot@gmail.com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

pkgbase=rust-git
pkgname=(
  rust-git
  rust-musl-git
  rust-src-git
  rust-wasm-git

  # x86_64 only
  lib32-rust-libs-git

  # cross targets
  rust-aarch64-gnu-git
  rust-aarch64-musl-git
)
pkgver=1.96.0.r1.g0312931
pkgrel=1
epoch=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (GIT VERSION)"
url=https://www.rust-lang.org/
arch=(
  aarch64
  loong64
  riscv64
  x86_64
)
license=("Apache-2.0 OR MIT")
depends=(
  bash
  compiler-rt
  curl
  gcc
  glibc
  libgcc
  libgit2
  libssh2
  libstdc++
  lld
  llvm-libs
  openssl
  zlib
)
makedepends=(
  clang
  cmake
  git
  rust
  libffi
  llvm
  musl
  ninja
  perl
  python
  wasi-libc
  wasm-component-ld
)
makedepends_loong64=(
  aarch64-linux-gnu-gcc
  aarch64-linux-gnu-glibc
  musl-aarch64
  musl-x86_64
)
makedepends_riscv64=(
  aarch64-linux-gnu-gcc
  aarch64-linux-gnu-glibc
  musl-aarch64
  musl-x86_64
)
makedepends_x86_64=(
  aarch64-linux-gnu-gcc
  aarch64-linux-gnu-glibc
  lib32-gcc-libs
  lib32-glibc
  musl-aarch64
)
checkdepends=(
  gdb
  procps-ng
)
options=(
  !emptydirs
  !lto
)
source=(
  git+https://github.com/rust-lang/rust.git

  # Patch bootstrap so that rust-analyzer-proc-macro-srv
  # is in /usr/lib instead of /usr/libexec
  0001-bootstrap-Change-libexec-dir.patch

  # Put bash completions where they belong
  0002-bootstrap-Change-bash-completion-dir.patch

  # Fix build with system rustc
  # https://github.com/rust-lang/rust/issues/143735
  0003-bootstrap-Workaround-for-system-stage0.patch

  # Use our *-pc-linux-gnu targets, making LTO with clang simpler
  0004-compiler-Change-LLVM-targets.patch

  # Use our ld.lld
  0005-compiler-Use-ld.lld-by-default.patch

  # Use our target-specific GCCs, like aarch64-linux-gnu-gcc
  0006-compiler-Use-target-specific-GCC-linkers.patch

  # Make the riscv64 musl target behave like the x86_64 musl target
  0007-compiler-Link-riscv64-musl-statically.patch

  # Prefer "lib" over "lib64"
  0008-compiler-Swap-primary-and-secondary-lib-dirs.patch
)
source_aarch64=(bootstrap.aarch64.toml)
source_loong64=(bootstrap.loong64.toml)
source_riscv64=(bootstrap.riscv64.toml)
source_x86_64=(bootstrap.x86_64.toml)
b2sums=('SKIP'
        '82fc40bdff90ef33b41d8d2c4e625ba600d830c42d9f46cb397e1de863f756a2c09f3ce877917e16aed7d5edccfa626ba50cc0423b51ed6b58b6b893edd475ac'
        '575d5d895eaf1767de983cd42cbd7d32018be7c03c0df4f0ed79e88463c348034ba9357955e0d9fc153764385cb4969a499a69b3fcef2025d6d642684df0c571'
        '4f0ff61346a77386ce2c56c54fd424838200ea87a83b6d80fb8d93f8804d297d879bd67a51ece88705eb867dad954beaedbc525c6bcb5e6d099802690afa4edb'
        'd587ff9463f09b5e04b556e22f60d0fee204931676f821d5d86b5b67429f158bd2f83693f7ed4d676b14c23ff171b91e7e28b601985e973f2b98fd2419bb704c'
        '7210f6762473d1cdc6a5e2c703be9d6d9aeeb813ec1e1dff099d90497c9fdb6cb8f298f34801bb0ff958fe2ac10635bb8631fa6cebeca203a3863bf789b069f9'
        '8015b14bd00f412c0935961fce5f9671fe3d51256a70eacbf61573c4c8ae35f3cd81372681fe406395ca571363e9f9a9c5b40969e79513f22d808e677a841ae7'
        '6e473abbda7e77fb399b1b5ff0a50efa6b324a4b9f8e0904a0ebca1258e9a84be840465ef1ad716d968fbb580e7bb77d4af2f7dbbbad258749eb9025a7cbc899'
        '991cb47155fb2a0d7969e3e2cbc44d030e9eb13474a38d9c9ad88365ce6ab6ecfb69692dd420d68f439585fa2a6e0139cd6f294b5487b77f6b875b773382a459')
b2sums_aarch64=('0a2c2c5c4ddadbfe269b4acd5ed0028e01f78c266e56de30010a6706a619e23db14e5f7578fc7b5974832fe48ccb2b5827c268c9c79bccd6ffa057f61ca52c86')
b2sums_loong64=('ca71cf8438d9a5cb898ffa176b99ef059ff0b62805bedce66c3f36dd20cd6be21e0d6bca7e765b717bdbb4a550404c75e64e0af7139bdb3dd98c3b281969de97')
b2sums_riscv64=('b2809d686b4301f755d0769d9edc4a8427d9aab0a74024254848315c7a5abb5f2ec06b33deb7f2a7b72035a4cf08efd313d42aec304ad852598580ba72a17003')
b2sums_x86_64=('6310635b44227fe5ab6a9a70dd7d2b520d223624d1b9069723ef914b7feb8920186099ce77fe903fc089583bbeba8df7ae97d26030c37d6337689133ac726f08')

# Make sure the duplication in rust-wasm is found
COMPRESSZST+=(--long)

pkgver() {
  cd rust
  local _ver="$(cat src/version)"
  _ver="$(echo $_ver | tr -d '[:space:]')"
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd rust

  git submodule init
  git submodule update

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  local clangdir
  clangdir="$(clang -print-resource-dir)"
  sed -e "s|%description%|Arch Linux $pkgbase $epoch:$pkgver-$pkgrel|g" \
      -e "s|%clangdir%|$clangdir|g" \
      "$srcdir/bootstrap.${CARCH}.toml" > bootstrap.toml

  sed -i 's/vendor = true/vendor = false/g' bootstrap.toml
  sed -i 's/locked-deps = true/locked-deps = false/g' bootstrap.toml
  sed -i 's/channel = "stable"/channel = "nightly"/g' bootstrap.toml
  sed -i 's/lto = "fat"/lto = "off"/g' bootstrap.toml
  sed -i '/rustc = "\/usr\/bin\/rustc"/d' bootstrap.toml
  sed -i '/cargo = "\/usr\/bin\/cargo"/d' bootstrap.toml
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  cd rust

  export LIBGIT2_NO_VENDOR=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export RUST_BACKTRACE=1
  unset CFLAGS CXXFLAGS LDFLAGS

  local xpy_options=(
    -j "$(nproc)"
  )

  local host_tuple do_pgo=0
  case $CARCH in
    aarch64|x86_64) host_tuple=$CARCH-unknown-linux-gnu; do_pgo=1 ;;
    loong64) host_tuple=loongarch64-unknown-linux-gnu ;;
    riscv64) host_tuple=riscv64gc-unknown-linux-gnu ;;
    *) host_tuple=$CARCH-unknown-linux-gnu ;;
  esac

  if (( do_pgo )); then
    local profraw="$PWD/build/profiles"
    mkdir -p "$profraw"

    echo "Building instrumented compiler..."
    python ./x.py build sysroot "${xpy_options[@]}" \
      --rust-profile-generate="$profraw"

    # Building cargo is our workload for profiling
    echo "Profiling instrumented compiler..."
    local stage2="$PWD/build/$host_tuple/stage2"
    LLVM_PROFILE_FILE="$profraw/default_%m_%p.profraw" \
      LD_LIBRARY_PATH="$stage2/lib" RUSTC="$stage2/bin/rustc" \
      cargo build --manifest-path=src/tools/cargo/Cargo.toml

    # Merge the profile data
    local profdata="$PWD/build/rustc.profdata"
    llvm-profdata merge -o "$profdata" "$profraw"

    stat -c "Profile data found (%s bytes)" "$profdata"
    test -s "$profdata"

    # Clean up profraw and instrumented stage2 artifacts
    echo "Removing instrumented compiler..."
    rm -r "$profraw" "$stage2"*/

    xpy_options+=(--rust-profile-use="$profdata")
  fi

  echo "Building optimized compiler..."
  DESTDIR="$srcdir/dest-rust" python ./x.py install "${xpy_options[@]}"

  cd ../dest-rust

  # delete unnecessary files, e.g. files only used for the uninstall script
  rm -v etc/target-spec-json-schema.json
  rm -v usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
  rm -v usr/lib/rustlib/manifest-*

  # licenses for main rust package
  local ldir="usr/share/licenses/rust" f d
  mkdir -p "$ldir"
  for f in usr/share/doc/*/{COPYRIGHT,LICENSE}*; do
    d="$(dirname "$f")"
    case $f in
      */LICENSE-APACHE) rm -v "$f" ;;
      *) mv -v "$f" "$ldir/${f##*/}.${d##*/}" ;;
    esac
    rmdir -p --ignore-fail-on-non-empty "$d"
  done

  # rustbuild always installs copies of the shared libraries to /usr/lib,
  # overwrite them with symlinks to the per-architecture versions
  ln -srvft usr/lib usr/lib/rustlib/$host_tuple/lib/*.so

  # Symlink the "self-contained" linker to our system lld
  mkdir -pv usr/lib/rustlib/$host_tuple/bin/gcc-ld
  ln -srvf  usr/bin/lld          usr/lib/rustlib/$host_tuple/bin/rust-lld
  ln -srvf  usr/bin/llvm-objcopy usr/lib/rustlib/$host_tuple/bin/rust-objcopy
  ln -srvft usr/lib/rustlib/$host_tuple/bin/gcc-ld usr/bin/{ld.lld,ld64.lld,lld-link,wasm-ld}

  _pick dest-musl usr/lib/rustlib/${host_tuple/gnu/musl}
  _pick dest-wasm usr/lib/rustlib/wasm32{,v1}-*
  _pick dest-src  usr/lib/rustlib/src

  case $CARCH in
    x86_64)
      _pick dest-i686 usr/lib/rustlib/i686-unknown-linux-gnu
      _pick dest-aarch64-gnu usr/lib/rustlib/aarch64-unknown-linux-gnu
      _pick dest-aarch64-musl usr/lib/rustlib/aarch64-unknown-linux-musl
      ;;
    loong64|riscv64)
      _pick dest-aarch64-gnu usr/lib/rustlib/aarch64-unknown-linux-gnu
      _pick dest-aarch64-musl usr/lib/rustlib/aarch64-unknown-linux-musl
      ;;
  esac
}

_install_licenses() {
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    "$srcdir/rust"/{COPYRIGHT,LICENSE-MIT}
}

package_rust-git() {
  depends+=(
    libcurl.so
    libgcc_s.so
    libgit2.so
    libssh2.so
    libssl.so
  )
  optdepends=(
    'gdb: rust-gdb script'
    'lldb: rust-lldb script'
  )
  provides=(
    cargo
    rust
    rustfmt
  )
  conflicts=(
    cargo
    rust
    'rust-docs<1:1.56.1-3'
    rustfmt
  )
  replaces=(
    cargo
    cargo-tree
    'rust-docs<1:1.56.1-3'
    rustfmt
  )

  cp -a dest-rust/* "$pkgdir"
}

package_rust-musl-git() {
  pkgdesc="Musl target for Rust (GIT VERSION)"
  depends=(rust-git)
  provides=(rust-musl)
  conflicts=(rust-musl)

  cp -a dest-musl/* "$pkgdir"
  _install_licenses
}

package_rust-src-git() {
  pkgdesc="Source code for the Rust standard library (GIT VERSION)"
  depends=(rust-git)
  provides=(rust-src)
  conflicts=(rust-src)

  cp -a dest-src/* "$pkgdir"
  _install_licenses
}

package_rust-wasm-git() {
  pkgdesc="WebAssembly targets for Rust (GIT VERSION)"
  depends=(
    rust-git
    wasm-component-ld
  )
  provides=(rust-wasm)
  conflicts=(rust-wasm)

  cp -a dest-wasm/* "$pkgdir"
  _install_licenses
}

package_lib32-rust-libs-git() {
  pkgdesc="32-bit target and libraries for Rust (GIT VERSION)"
  arch=(x86_64)
  depends=(
    lib32-gcc-libs
    lib32-glibc
    rust-git
  )
  provides=(lib32-rust lib32-rust-libs)
  conflicts=(lib32-rust lib32-rust-libs)
  replaces=(lib32-rust)

  cp -a dest-i686/* "$pkgdir"
  _install_licenses

  cd "$pkgdir"
  mkdir -pv usr/lib32
  ln -srvft usr/lib32 usr/lib/rustlib/i686-unknown-linux-gnu/lib/*.so
}

package_rust-aarch64-gnu-git() {
  pkgdesc="AArch64 GNU target for Rust (GIT VERSION)"
  arch=(
    loong64
    riscv64
    x86_64
  )
  depends=(
    aarch64-linux-gnu-gcc
    aarch64-linux-gnu-glibc
    rust-git
  )
  provides=(rust-aarch64-gnu)
  conflicts=(rust-aarch64-gnu)

  cp -a dest-aarch64-gnu/* "$pkgdir"
  _install_licenses
}

package_rust-aarch64-musl-git() {
  pkgdesc="AArch64 Musl target for Rust (GIT VERSION)"
  arch=(
    loong64
    riscv64
    x86_64
  )
  depends=(
    aarch64-linux-gnu-gcc
    rust-git
  )
  provides=(rust-aarch64-musl)
  conflicts=(rust-aarch64-musl)

  cp -a dest-aarch64-musl/* "$pkgdir"
  _install_licenses
}

# vim:set ts=2 sw=2 et:
