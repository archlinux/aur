# Maintainer: Taha Moosavi <taha.moosavi.taha@gmail.com>
_pkgname=autopilot-rs
pkgname=$_pkgname-git
pkgver=r82.e4e759e
pkgrel=1
pkgdesc="AutoPilot-rs runs automation jobs based on conditions like WiFi, Bluetooth, battery, CPU usage, and more."
arch=('x86_64')
url="https://github.com/streamtechteam/autopilot-rs"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('systemd-libs' 'libxcb' 'libxrandr' 'libx11' 'libxau')
makedepends=('rust' 'cargo' 'libxcb' 'libxrandr' 'libxau' 'libx11' 'git')
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"

    # This generates a version like "r10.abc1234"
    # r10 = 10 commits since last tag
    # abc1234 = the short commit hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Build from the directory where PKGBUILD is located
  cd "$startdir/src/$_pkgname"
  cargo build --release --locked
}

package() {
  # Reference the binary using the absolute start directory
  install -Dm755 "$startdir/src/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # If you have a license file, it's good practice to include it:
  install -Dm644 "$startdir/src/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
