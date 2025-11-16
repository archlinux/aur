# --- Metadata ---
pkgname=shelly-cli
_pkgname=shelly-cli
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Command line helper for Shelly desktop"
arch=('x86_64') # It's a compiled binary
url="https://github.com/manpreet113/shelly-cli"
license=('MIT') 
depends=(
    'shelly-shell'
    'quickshell'
    'hyprland'
    'slurp'
    'grim'
    'wl-clipboard'
    'libnotify' # This is what `notify-rust` uses
)
makedepends=('git' 'cargo') # Needed to build
source=("git+$url.git")
sha256sums=('SKIP')

# --- Versioning ---
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# --- Build ---
# This function compiles your Rust code
build() {
  cd "$_pkgname" # Go into the cloned Rust repo
  
  # This is the standard command to build a Rust binary
  # --locked ensures it uses the Cargo.lock file
  cargo build --release --locked
}

# --- Package ---
# This function installs the compiled binary
package() {
  cd "$_pkgname"
  
  # Install the binary to /usr/bin/shelly
  # -Dm755 = Create Directories, set permissions to 755 (executable)
  install -Dm755 "target/release/shelly" "${pkgdir}/usr/bin/shelly"
}