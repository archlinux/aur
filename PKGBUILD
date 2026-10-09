# Maintainer: Adrien Peslerbe <adrien@pesler.be>
# Arch/Manjaro source package for Veshell.
#
# Generated from templates/PKGBUILD.in by
# scripts/render-recipes.py. Do not edit by hand.
#
# Builds the Dart shell and the Rust compositor from source, entirely offline.
# All external Flutter inputs are pinned and checksummed: the official Flutter
# SDK bundle, the matching engine artifacts, and the meta-flutter embedder
# engine. `build-veshell.sh` is a copy of scripts/build-veshell.sh.
#
# The two generated inputs (Cargo vendor tree, Dart pub cache) are published
# alongside each release. Regenerate and refresh their checksums with
# scripts/generate-inputs.sh, then re-render this recipe.

pkgname=veshell
pkgver=0.1.1
pkgrel=1
pkgdesc="An innovative Not-Desktop environment for Linux built with Flutter and Rust"
arch=('x86_64')
url="https://github.com/free-explorers/veshell"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig' 'ttf-roboto' 'noto-fonts' 'noto-fonts-cjk'
  'libglvnd' 'mesa'
  'libinput' 'seatd' 'systemd-libs' 'libxkbcommon' 'libxkbcommon-x11'
  'libdisplay-info' 'wayland'
  'pipewire' 'libpulse'
  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good'
  'dbus' 'upower' 'polkit'
  'xorg-xwayland' 'xdg-desktop-portal' 'xdg-utils'
)
makedepends=(
  'rust' 'clang' 'cmake' 'ninja' 'pkgconf' 'git'
  'unzip' 'zstd' 'xz'
  'gtk3' 'libpulse'
  'libinput' 'seatd' 'mesa' 'openssl'
  'pipewire' 'gstreamer' 'gst-plugins-base-libs'
  'libxkbcommon' 'libdisplay-info' 'wayland' 'systemd-libs'
  'vulkan-icd-loader'
)
optdepends=(
  'networkmanager: network control panel'
  'bluez: Bluetooth control panel'
  'rtkit: real-time audio scheduling'
  'xdg-desktop-portal-gtk: GTK portal fallback backend'
)
provides=('wayland-compositor')
conflicts=('veshell-git')
# makepkg's global `lto` option adds -flto to CFLAGS. The libspa-sys build
# script compiles a C shim into a static archive; LTO objects there are not
# resolved by rustc's final (non-LTO) link. Disable LTO for this package.
options=('!lto')

# --- pinned inputs ----------------------------------------------------------
_veshell_commit=62cc96a5d8450ba0f23e5a87d5ba4c4e033739c7
_flutter_version=3.47.2
_flutter_engine_revision=a804b261645ef8c13eb3d5c44a5c2fb0340c5539
_input_mirror="${VESHELL_INPUT_MIRROR:-https://github.com/free-explorers/veshell-packaging/releases/download/packaging-inputs-v0.1.1}"

source=(
  "veshell::git+https://github.com/free-explorers/veshell.git#commit=$_veshell_commit"
  "build-veshell.sh"
  "flutter_linux_${_flutter_version}-stable.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.47.2-stable.tar.xz"
  "flutter_patched_sdk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/a804b261645ef8c13eb3d5c44a5c2fb0340c5539/flutter_patched_sdk.zip"
  "flutter_patched_sdk_product.zip::https://storage.googleapis.com/flutter_infra_release/flutter/a804b261645ef8c13eb3d5c44a5c2fb0340c5539/flutter_patched_sdk_product.zip"
  "linux-x64_artifacts.zip::https://storage.googleapis.com/flutter_infra_release/flutter/a804b261645ef8c13eb3d5c44a5c2fb0340c5539/linux-x64/artifacts.zip"
  "linux-x64-debug_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/a804b261645ef8c13eb3d5c44a5c2fb0340c5539/linux-x64-debug/linux-x64-flutter-gtk.zip"
  "linux-x64-profile_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/a804b261645ef8c13eb3d5c44a5c2fb0340c5539/linux-x64-profile/linux-x64-flutter-gtk.zip"
  "linux-x64-release_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/a804b261645ef8c13eb3d5c44a5c2fb0340c5539/linux-x64-release/linux-x64-flutter-gtk.zip"
  "linux-engine-sdk-release-x86_64-${_flutter_engine_revision}.tar.gz::https://github.com/free-explorers/flutter-engine/releases/download/linux-engine-sdk-release-x86_64-a804b261645ef8c13eb3d5c44a5c2fb0340c5539/linux-engine-sdk-release-x86_64-a804b261645ef8c13eb3d5c44a5c2fb0340c5539.tar.gz"
  "veshell-cargo-vendor-0.1.1.tar.zst::$_input_mirror/veshell-cargo-vendor-0.1.1.tar.zst"
  "veshell-pubcache-0.1.1.tar.zst::$_input_mirror/veshell-pubcache-0.1.1.tar.zst"
)
sha256sums=(
  'SKIP'  # pinned git commit
  '5c1b5bd5fe092615e36a9a3e958d4182c2573f2d0d06ace68f9a6ceb45cd9409'  # build-veshell.sh
  '447878859d01ca9bfdb99a85f245af07ed8a15fedcd9d189c4749e8e92d1f185'  # Flutter SDK
  '5f7d44ecaa2f3d219b9fdf2a1c3977e83545f6f8797fad604f564c1b4154ec8d'  # patched_sdk
  '902bc3b27a1bd3f13b756af2660891dd996eb33ab9bc3e4b89c0c9cfdf49e2aa'  # patched_sdk_product
  '625c7f98c62b9d495638bc71774bf94ad8cae77b070b5f34797ea83b396ebc1c'  # linux-x64 artifacts
  'e324b676106db415bec41d211caeb7a5137d061704f7af83264f382b4e2ff354'  # linux-x64 debug gtk
  '0a507e7c6f49c8905efc809808e1a2ac21bcf2c732b82c10e74f8f1e6d1828ea'  # linux-x64 profile gtk
  '3b357f3df3549c69535d92e8e300a66e1057876dc8fed45a8aae7cf7681b7ec4'  # linux-x64 release gtk
  '539254d41100c2dc338920dae968dc2cf0b7c35e5f00764ab5d24ebc37712f87'  # embedder engine
  'a99abcb0d71d55620df66fe6a81b4543273ca6143311d6c145a204d2241af21f'  # cargo vendor
  '90b0a95878c6735221301b38f363b8e243c679da11aa439286a302ee2c85e264'  # pub cache
)

# The helper extracts every archive itself (into deterministic locations);
# let makepkg keep the raw sources untouched.
noextract=(
  "flutter_linux_${_flutter_version}-stable.tar.xz"
  "flutter_patched_sdk.zip"
  "flutter_patched_sdk_product.zip"
  "linux-x64_artifacts.zip"
  "linux-x64-debug_flutter-gtk.zip"
  "linux-x64-profile_flutter-gtk.zip"
  "linux-x64-release_flutter-gtk.zip"
  "linux-engine-sdk-release-x86_64-${_flutter_engine_revision}.tar.gz"
  "veshell-cargo-vendor-0.1.1.tar.zst"
  "veshell-pubcache-0.1.1.tar.zst"
)

prepare() {
  cd veshell
  mkdir -p "$srcdir/flutter-sdk" "$srcdir/cargo-vendor" "$srcdir/pubcache"
  tar -xJf "$srcdir/flutter_linux_${_flutter_version}-stable.tar.xz" \
    -C "$srcdir/flutter-sdk" --strip-components=1
  tar -xf "$srcdir/veshell-cargo-vendor-0.1.1.tar.zst" -C "$srcdir/cargo-vendor"
  tar -xf "$srcdir/veshell-pubcache-0.1.1.tar.zst" -C "$srcdir/pubcache"
}

build() {
  cd veshell
  VESHELL_SRC="$PWD" \
  FLUTTER_SDK_DIR="$srcdir/flutter-sdk" \
  FLUTTER_ARTIFACT_DIR="$srcdir" \
  ENGINE_TARBALL="$srcdir/linux-engine-sdk-release-x86_64-${_flutter_engine_revision}.tar.gz" \
  CARGO_VENDOR_DIR="$srcdir/cargo-vendor" \
  PUB_CACHE_DIR="$srcdir/pubcache" \
  PREFIX=/usr \
  POLKIT_HELPER_PATH=/usr/lib/polkit-1/polkit-agent-helper-1 \
  JOBS="$(nproc)" \
  bash "$srcdir/build-veshell.sh" build
}

package() {
  cd veshell
  VESHELL_SRC="$PWD" \
  PREFIX=/usr \
  DESTDIR="$pkgdir" \
  bash "$srcdir/build-veshell.sh" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
