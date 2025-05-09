# Maintainer: Frogprog frogprog09@gmail.com
pkgname=frogprog-hyprland-light-git
pkgbase=frogprog-hyprland-light-git
pkgver=1.2.3
pkgrel=1
epoch=
pkgdesc="productive dark hyprland setup for laptop (14 inch)"
arch=('x86_64')
url="https://github.com/FrogProg09/my-linux"
_branch='gruvbox-light'
license=('BSD')
#groups=()
depends=(
  'hyprland'
  'hyprlang'
  'hyprlock'
  'hyprpaper'
  'hypridle'
  'waybar'
  'rofi-wayland'
  'kitty'
  'mako'
  )
makedepends=('git')
#checkdepends=()
optdepends=(
  'nautilus'
  'hyprpolkitagent'
  'starship'
  )
#provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("git+${url}#branch=${_branch}") # specifying branch from repo
# noextract=()
sha256sums=('SKIP')
# validpgpkeys=()

pkgver() {
  cd "$srcdir/my-linux" || return 1 

  # Get the last tagged version, number of commits since that tag, and abbreviated commit hash
  local version
  version="$(git describe --tags --abbrev=0 2>/dev/null || echo "v1.2.3")"  # Fallback to "0.0.0" if no tags
  local commits
  commits="$(git rev-list --count HEAD ^"$version")"  # Count commits since last tag
  local hash
  hash="$(git rev-parse --short HEAD)"  # Get short commit hash

  # Remove the 'v' prefix from tags (if present)
  version="${version#v}"

  # Only keep characters allowed in pkgver
  echo "${version}.${commits}.${hash}"
}

# build() {}

package() {
  cd "$srcdir/my-linux"  # Change to the source directory

  # Make sure the install.sh script is executable
  chmod +x install.sh

  # Execute the install script with the target directory
  # Here you direct it to the package directory
  ./install.sh --prefix="$pkgdir"
}
