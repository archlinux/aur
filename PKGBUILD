# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-dsc
pkgver=3.3.0
pkgrel=3
pkgdesc="Microsoft Desired State Configuration v3 platform"
arch=(x86_64 aarch64)
url='https://github.com/PowerShell/DSC'
license=(MIT)
depends=(glibc libgcc bash)
# PowerShell before 7.6.9-3 crashes when started from pwsh, which the PowerShell adapter does
optdepends=('powershell>=7.6.9-3: PowerShell adapter and resources')
makedepends=(git cargo tree-sitter-cli nodejs protobuf 'powershell>=7.6.9-3')
checkdepends=(powershell-pester-4)
# Upstream created the v3.3.0 tag from main (3.4.0-preview.1) instead of the release commit
# on release/v3.3, which the published release was built from
_commit="ea572fa755dbd49fb52339043409fbd50a625600"
# PowerShell's test of its DSC resource for profiles, which needs dsc and so is run here instead of
# in the powershell package
_pwshver=7.6.9
_pwshtests="https://raw.githubusercontent.com/PowerShell/PowerShell/v$_pwshver/test/powershell/dsc"
source=("$pkgname::git+$url#commit=$_commit"
  "dsc-build.ps1"
  "dsc-test.ps1"
  "dsc-profile-test.ps1"
  "dsc-install.ps1"
  "osinfo-rolling-release.patch"
  "$_pwshtests/dsc.profileresource.Tests.ps1"
  "$_pwshtests/psprofile_currentuser_allhosts.dsc.yaml"
  "$_pwshtests/psprofile_currentuser_currenthost.dsc.yaml"
  "$_pwshtests/psprofile_export.dsc.yaml")
sha512sums=('4a52d6505cc110c2b14a0609994d3a30c6bc2a1cca8bd01e7eed76eca5c8d41ad25e991b7763b0ff5a94ec4bbb7d1a724818625336939b37649bc302fd2bafb1'
  '0f762c3f7dbb670271d0ab8eef000b2c4ca775fdd6d83df9cefb6c19ac0b80f3c0f4130af580ec8f042e097fb7b04dedf0d30d9c38ad1d697861a23c0aeb1201'
  '42ac292c0153c023f331c8e625eabe7b47fc4a3994339efdacaa907284bfb94d93110a249e0f626f055580ef31267fd94bc762d627d1bc23132e7d8f402e7e10'
  '09892272b6a2e254a02b16fe886f10d38e0393613eeeb815fa709e0adf9c012d51371432a6b2107c46ee42137b6b8c00ad4ad186b7e4f18d5bb4807838226415'
  '03cf6b804742898d7ffc31ec7ac95d5331345344c0ae37af0d9c8e357852d69435f7b41a53c5e36d8907834ab440d1619b4d39942f89357800bd6896e61fb83c'
  'bf7f14353e8012043e5e323ad984729ce8c163a7b02c53f9ba3a0a90b3acbf8162370114cd2ae4cc1d725a72f9f3930d044c7a3cd29c3e9efb19116cf24dff57'
  'e135b85886f7f1e96cd115b60dbaed947257720283c4db93da5f9dd5de0a09b0e238a6fbc8d6058adbd04e25abded3c7ea55b7ba76dfeec82d3f026e371a8b2b'
  '30bce0c6ed3ebacaf246112c7cfa3ce225fb32c860aff6a6de00e8ac2864590d7c54c663c2ca6e1e119615ad83e54e441a6b5c77065b3690252239c77f8398c9'
  '3ced6c483d068986e248312085e6241922139bfee10c718a8a0d883ed62dc4e37bf2d0ab9046b79b991fe2867bdcbdefd33a6353f4302ab9a3479fc78b610df4'
  '9fb2d467b065223115d22b7c8def7b5655b94a9ffccd4759c6e3bf702454b5b375a22775ea2fbf0424fedfa3f9d7eedd3f641f86409fa188a04234e263762cb4')
b2sums=('6b85f40d3aa0cdc98a3ca6fc64542be38ea62b69b08a5cb7ab666e810fa81882834799394755e7c5b2fb473e7ae275f63e2f0f53e19a862f467cde57a4231bd3'
  'a748f6bd6fd936dde3474c4f408a9bd02fee7835c74a64f743efbe21b63c25dda651f683d1a84ee00e390a76136fe92dee2f40fe0a7c2225e32cfbe6fc336c1d'
  'b9847257dd67b82122397627bb2a09ed405349489da53ebc13367ac69b8003b919fb2f7ba1727f10d97096a9d8b0308021dfbf1918a6dd979444a8bc8286bffb'
  'ec2b170b1e54b10de1deed49e54684c8437b658765cce345c34f0f966fca0cd329ed70a7cd6d829ee6ea2b92186126aeb1a913923e07c79b9f447662c2353277'
  '1d1dc447d99267dee933fa483b3e04305e6492153a725bd4d949d93c3634e969a2ab056cb81797609c9f435a8e3ac202eb8a630e1340ac9ad2b5936bb4c11f49'
  '3ac05a07200e7099e6f880dfb9a52091adaa5c26f062869962b554b72a028e8ed6853c06832837caba03944eef094cd100b3a54d87e46a8e5d37bfbc0b8ae5d9'
  'e87a47ed617760747b1c44a9253cbd2f01f6603d9f64647910932111f696a443799b3d4fb10f97e0902e3fd477a1b2909e060c50a8f823b5b1b3fee36f6e4370'
  'dc5d32d6e4e498a034e3acdd78b88bf638a7a44ef5f4ff0c2bc9e00ec6a743bc7844bc3bdee10de56872f774eadd22468a1368d3c9b71dff8577350f9d1f0e6d'
  '484c0bbc4dd4bb5c6a20be4a0c73f91c3574c92247040ee61b5b2e17db8b180f7e2af5f0e467587e64fafce5a8de58e04659cef365bcb738dbdb5595dec90b8e'
  '4052ddb2f7675b6c94fcffc29fe5c6ed3a4538604b1588e76f5808ab1024ffc45bdeb3e719f62fad08478932635339c28a0f56e0e033452025c7c55105f873f9')
options=(!lto !debug)

# Sets up cargo for the package architecture ($CARCH). A cross build (an x86_64 host building for
# aarch64) needs the Rust standard library of the target (e.g. rust-aarch64-gnu), the binutils for
# $CARCH (e.g. aarch64-linux-gnu-binutils) and a root file system for $CARCH with base-devel in
# ROOTFS_DIR, like dotnet-system-io-ports-native: clang and lld compile the grammars and link against
# its C library and GCC. The C code for the build host (build scripts, grammars) is built without the
# target's flags of the makepkg configuration for $CARCH.
_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  _target=host-tuple _architecture=current
  [[ "$(uname -m)" == "$CARCH" ]] && return 0
  if [[ ! -d "${ROOTFS_DIR:-}" ]]; then
    echo "powershell-dsc: a cross build needs ROOTFS_DIR set to a $CARCH root file system" >&2
    exit 1
  fi
  _target="$CARCH-unknown-linux-gnu" _architecture="$CARCH-unknown-linux-gnu"
  local _triple="${_target//-/_}" _clang="clang --target=$_target --sysroot=$ROOTFS_DIR"
  export "CC_$_triple=$_clang" "CXX_$_triple=${_clang/clang/clang++}" "AR_$_triple=$CARCH-linux-gnu-ar"
  export "CARGO_TARGET_${_triple^^}_LINKER=clang"
  RUSTFLAGS+=" -C link-arg=--target=$_target -C link-arg=--sysroot=$ROOTFS_DIR -C link-arg=-fuse-ld=lld"
  export RUSTFLAGS HOST_CFLAGS=-O2 HOST_CXXFLAGS=-O2
  # The C flags of makepkg only for the target's C code: the build compiles the grammars for the build
  # host as well (tree-sitter generate --build), which takes CFLAGS and not HOST_CFLAGS
  export "CFLAGS_$_triple=$CFLAGS" "CXXFLAGS_$_triple=$CXXFLAGS"
  unset CFLAGS CXXFLAGS
}

prepare() {
  # Upstream uses a private registry
  # We need to delete this to use the usual crates.io
  rm "$pkgname"/.cargo/config.toml

  cd "$pkgname" || exit
  # Microsoft/OSInfo can't compare non-numeric versions like Arch's "Rolling Release" and reported a
  # requested codename as in the desired state although Arch has none. Fixed upstream on main.
  # Upstream issue: https://github.com/PowerShell/DSC/issues/1777
  # Upstream fix: https://github.com/PowerShell/DSC/pull/1778
  patch -Np1 -i "$srcdir/osinfo-rolling-release.patch"

  _cargo_env
  cargo fetch --locked --target "$_target"
}

build() {
  _cargo_env
  # Everything was fetched in prepare()
  export CARGO_NET_OFFLINE=true
  # The build copies dsc and the resources into bin/, which git doesn't track, so files of earlier
  # builds stay there (e.g. resources of the v3.3.0 tag, which 3.3.0-1 was built from). dsc and the
  # tests would find those as resources next to dsc.
  rm -rf "${srcdir:?}/$pkgname/bin"
  pwsh -NoProfile -NonInteractive -File dsc-build.ps1 -SourcePath "$srcdir/$pkgname" -Architecture "$_architecture"
}

check() {
  _cargo_env
  # The binaries of a cross build ($CARCH differs from the build host) are for another architecture,
  # run the tests natively on the target instead
  if [[ "$_architecture" != current ]]; then
    echo 'powershell-dsc: skipping the tests on a cross build; run them natively on the target' >&2
    return 0
  fi
  # A temp folder of their own, so files with fixed names that another user's build left in /tmp
  # can't get in the way. It stays in /tmp rather than $srcdir, as .NET's named pipes are sockets in
  # it, whose paths can't be longer than 108 bytes.
  local _test_tmp
  _test_tmp=$(mktemp -d)
  export TMPDIR="$_test_tmp"
  export CARGO_NET_OFFLINE=true
  # Run the tests with a home of their own, so they neither see the profiles, modules and configs
  # of the user building the package, nor leave their own files behind in the user's home.
  # Cargo and rustup keep using the builder's ones, which have what prepare() fetched.
  export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
  export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
  rm -rf "$srcdir/test-home"
  export HOME="$srcdir/test-home"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_STATE_HOME="$HOME/.local/state"
  mkdir -p "$HOME"

  cd "$srcdir" || exit
  pwsh -NoProfile -NonInteractive -File dsc-test.ps1 -SourcePath "$srcdir/$pkgname" -ModulePath "$srcdir/test-modules"
  pwsh -NoProfile -NonInteractive -File dsc-profile-test.ps1 -DscRoot "$srcdir/$pkgname/bin/release" \
    -TestPath "$srcdir/dsc.profileresource.Tests.ps1"
  rm -rf "${_test_tmp:?}"
}

package() {
  # Same layout as upstream's packages: everything in one folder, as dsc looks for resources next
  # to itself and the PowerShell adapter runs ./psDscAdapter/powershell.resource.ps1 from there.
  # Only dsc and dsc-bicep-ext are put on PATH.
  _cargo_env
  pwsh -NoProfile -NonInteractive -File dsc-install.ps1 -SourcePath "$srcdir/$pkgname" -Architecture "$_architecture" \
    -Destination "$pkgdir/usr/lib/DSC"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/DSC/dsc "$pkgdir/usr/bin/dsc"
  ln -s /usr/lib/DSC/dsc-bicep-ext "$pkgdir/usr/bin/dsc-bicep-ext"

  install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
