# Maintainer: Barry <howtoedittv@gmail.com>
pkgname=mogit
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple GitHub repo helper script"
arch=('x86_64')
url="https://github.com/howtoedittv/mogit"
license=('MIT')
depends=('git' 'github-cli' 'xdg-utils')
makedepends=('git' 'yay')   # yay to install dependencies if needed

source=("git+https://github.com/howtoedittv/mogit.git")
sha256sums=('SKIP')

# Check if package installed
is_installed() {
  pacman -Qi "$1" &>/dev/null
}

# Install missing dependencies via pacman
install_deps() {
  for dep in git github-cli xdg-utils; do
    if ! is_installed "$dep"; then
      sudo pacman -Sy --needed "$dep"
    fi
  done
}

build() {
  # Install deps before building
  install_deps

  # Clone repo is already handled by git+source
  cd "$srcdir/mogit"
  # nothing else to build; it's just a script
}

package() {
  cd "$srcdir/mogit"

  # create required directories
  install -dm755 "$pkgdir/usr/bin"

  # install mogit script
  install -Dm755 mogit "$pkgdir/usr/bin/mogit"
}

