pkgname=quickshell-overview-git
pkgver=r18.272b4e7
pkgrel=1
pkgdesc="A standalone workspace overview module for Hyprland using Quickshell"
arch=('any')
url="https://github.com/Shanu-Kumawat/quickshell-overview"
depends=('quickshell')
optdepends=(
    'hyprland: The compositor this module is designed for'
    'matugen: For dynamic color generation based upon wallpaper'
)
makedepends=('git')
provides=("qc-overview")
conflicts=("qc-overview")
source=(
    "${pkgname}::git+https://github.com/Shanu-Kumawat/quickshell-overview.git"
    "qc-overview.sh"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  # Define the target directory
  local _dest="$pkgdir/etc/xdg/quickshell/overview"
  install -d "$_dest"

  # Copy all files to the destination
  cp -a ./* "$_dest/"
  # Remove git-related files from the package
  rm -rf "$_dest/.git"

 install -Dm755 "$srcdir/qc-overview.sh" "$pkgdir/usr/bin/qc-overview"

  # Install the license file if it exists (assuming MIT/LICENSE)
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
