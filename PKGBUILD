# Maintainer: sfs <sfslinux at gmail dot com>
# Original patch author: lemonsh <lemon@lemonsh.moe>; see AUTHORS-PATCHES.md.

pkgname=virsh-tui-lemon
pkgver=0.1.0.r28.g225c9a0
pkgrel=1
pkgdesc='Keyboard-driven libvirt TUI with preserved lemonsh patches'
arch=('x86_64')
url='https://github.com/SyscallBrain/virsh-tui'
license=('MIT')
depends=('glibc' 'gcc-libs' 'libvirt')
makedepends=('git' 'rust>=1.88')
optdepends=('virt-install: create virtual machines'
            'virt-viewer: graphical guest console'
            'openssh: remote libvirt connections')
provides=('virsh-tui=0.1.0')
conflicts=('virsh-tui' 'virsh-tui-git')
options=('!lto')

# Fixed common base: the complete local series was exported against this commit.
_base_commit=639d31d979bf32ea2a30de0163f89442f850bf32
_lemon_patches=(
  '0001-fix-live-harden-disconnected-state-and-optimize-allo.patch'
  '0002-fix-ui-fill-entire-screen-with-background-color-to-e.patch'
  '0003-fix-theme-support-truecolor-on-Windows-fix-xterm-256.patch'
  '0004-feat-backend-add-remote-node-stats-parsing-and-telem.patch'
  '0005-feat-poller-support-concurrent-remote-host-sampling-.patch'
  '0006-feat-ui-adapt-host-view-dashboard-gauges-and-topbar-.patch'
  '0007-feat-app-handle-full-connection-lifecycle-and-event-.patch'
  '0008-docs-document-remote-libvirt-telemetry-fidelity-and-.patch'
  '0009-chore-build-update-deps-remove-unused.patch'
  '0010-fix-app-handle-polkit-authentication-gracefully-and-.patch'
  '0011-feat-backend-cache-autostart-domains-throttle-teleme.patch'
  '0012-feat-input-add-leader-popup-enable-instant-tab-switc.patch'
  '0013-feat-input-unify-keymap-single-source-of-truth-acros.patch'
  '0014-perf-app-implement-reactive-dirty-flag-rendering-to-.patch'
  '0015-feat-input-cycle-focus-with-Tab-remove-h-l-focus-bin.patch'
  '0016-chore-remove-tests-rewrite-docs-suite-and-update-use.patch'
  '0017-feat-ui-display-help-as-single-column-with-focused-f.patch'
  '0018-fix-detail-clamp-XML-scrolling-index-to-maximum-visi.patch'
  '0019-feat-events-cycle-filters-with-Tab-instead-of-f-F.patch'
  '0020-chore-rustfmt.patch'
  '0021-feat-input-use-PrevTab-NextTab-h-l-for-filter-cyclin.patch'
  '0022-refactor-input-unify-keymap-as-single-source-of-trut.patch'
  '0023-refactor-simplify-codebase-and-remove-unused-widgets.patch'
)
_pane_patch='0024-Replace-boxed-panels-with-pane-and-separator-layout.patch'
_pane_layout=(
  "$_pane_patch" # Comment out only this line to build without pane-layout.
)

# Patch 0016 exceeds AUR's 500000-byte blob limit; keep its original bytes in text parts.
_large_patch=${_lemon_patches[15]}
_large_patch_parts=("$_large_patch.part01" "$_large_patch.part02" "$_large_patch.part03")
# Always retain all source files/checksums, even when pane-layout is disabled.
source=("virsh-tui::git+https://github.com/SyscallBrain/virsh-tui.git#commit=$_base_commit"
        "${_lemon_patches[@]:0:15}"
        "${_large_patch_parts[@]}"
        "${_lemon_patches[@]:16}"
        "$_pane_patch"
        'restore-tests.patch'
        'AUTHORS-PATCHES.md')
sha256sums=('SKIP'
            'd657c6cad291c35b9edc2cb8c2fefe3cd1941aaf1128059067a42a276c42a145'
            '05b622855bafc677f7966515348b2c4f0dce723468d21b88b23c6ee63a5a44e2'
            'ce05381df57384f4820995541549de2e9cbbe09f5683d9ce74a47775f396a469'
            '6fecd510271b0bde9a010aac5f2aea065af251386cabdc7cbd83d18236cff405'
            '2acc885a61fb044ea34f2a46c025d613402c88dd72b69e2727282a13becb6fa0'
            'e395ab93708a3be3884e65a75917c5c58615e7cfde4ebcdaf1b5cb4e567d0c8d'
            '177ed712b1be4df6d4d5a571678fefa4dd57a57bb5857d162612fa087abe75e6'
            'b0f0db36fa47c6c0991cd0a90ebdf24f4a9d2bfc48d9fe45466769752c84dee4'
            '3558f4d0a6d1267e6eb397b659eec18424a2c2afb4a53f8cf4b93ca425d368f6'
            '91f18b0356dee69dc97bbeb6b5ff062f252ccf4afada957c62ccc9d5c05696af'
            '77308f849892932e0a53f578cef36f9ebd44840d13f67763c0fa1459d31902ad'
            'acf330137a4ffe8764d1a98c530e52dd36f7d811b6b82d7f3b0c7267b379ffdf'
            '13b2a4f5e399eabfdfc46ab54ca97215e62cc6b90a0339db275e7c53e9c62828'
            'f113ff8d3e5d6273a07d4c96c2d4460685a771ca93b1e94e70183ea5ff0228fc'
            'e9c562039553a7352dfd901881c2cbfae7a06e20dcb89c11df35138ba27fd0c2'
            '51250fecb80bd6fefbdf029280bb4395ffbaa801384a61bf3f604bc4e4bd48d5'
            'c70f536b338f0bd38d2aa2bb084e36c221f96fd8c915eedb39842541dde8f3eb'
            'd1bcb12e812110ca8b440bf8b17d0f00180210fc040d966210d26719744049bd'
            '59f7f45d7ea8cd68cc10b807d19186f6501f16b44eaa861f79c1202eaf4c4eb6'
            '5f720089f7cd772599dc5c91bd2c8d2a7149a2a41789de9269ac9292c0b2d712'
            'e8a270753e935d06098e9d9971b3ec58026c66e99b482e40165eb868fdfedf1a'
            'c0b56509f14b5c1bea96ee6128bd39b9780d122eb88292bb8ff4794ac967e7af'
            '612b886081ad37625b840f19996c7f6492fd455709babf1e872fda4fbaead020'
            '307830db8071df09794551a60a68652db49f828dca67fd90c52e42a03f5e676d'
            '6f75ada51e37c24ed66499a3684a0eda57cb5e9b90c36e6a524fa8fdcb4e834c'
            '41f8a0e771453ddc6769ee5183225581dab4a68fca2da7b5db6b778938ca2000'
            '7947dd85eaa1da8c1e3f711574a673d525e3cf97fbb1095ec5a6551b50cfba16'
            'd364fcef89eba2cb1c12f6c4ec8372a566eb475db321eca76c770fb89e3a18a9')

pkgver() {
  # Versions name the reconstructed original fork checkpoints, not new commits.
  if ((${#_pane_layout[@]})); then
    printf '%s\n' '0.1.0.r28.g225c9a0'
  else
    printf '%s\n' '0.1.0.r27.g8e8626f'
  fi
}

prepare() {
  cat "$srcdir/$_large_patch".part{01,02,03} > "$srcdir/$_large_patch"
  printf '%s  %s\n' '28835a5c3595be827fb1a8c8b7f48058cf221410ca98876fcbb5ab8988821ea5' \
    "$srcdir/$_large_patch" | sha256sum --check -
  cd "$srcdir/virsh-tui"
  for _patch in "${_lemon_patches[@]}" "${_pane_layout[@]}" 'restore-tests.patch'; do
    git apply --whitespace=nowarn --check "$srcdir/$_patch"
    git apply --whitespace=nowarn "$srcdir/$_patch"
  done
  cargo fetch --locked
}

build() {
  cd "$srcdir/virsh-tui"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/virsh-tui"
  cargo test --release --frozen
}

package() {
  cd "$srcdir/virsh-tui"
  install -Dm755 "${CARGO_TARGET_DIR:-target}/release/virsh-tui" "$pkgdir/usr/bin/virsh-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/AUTHORS-PATCHES.md" "$pkgdir/usr/share/doc/$pkgname/AUTHORS-PATCHES.md"
}
