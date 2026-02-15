# Maintainer: <Cleboost> <clement.balarot@gmail.com>

pkgname=noctyra-dotfiles-git
pkgver=0
pkgrel=1
pkgdesc="Noctyra dotfiles (git) - stow packages installed system-wide"
arch=('any')
url="https://github.com/noctyra-dots/dotfiles"
license=('MIT')

depends=('stow')
makedepends=('git')

provides=('noctyra-dotfiles')
conflicts=('noctyra-dotfiles')

source=("dotfiles::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd dotfiles
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/usr/share/noctyra"

  if [[ -d "dotfiles/stow" ]]; then
    cp -a "dotfiles/stow" "$pkgdir/usr/share/noctyra/"
  else
    echo "ERROR: expected 'stow/' directory at repository root."
    echo "Make sure your repo contains: stow/<module>/.config/..."
    return 1
  fi

  # [[ -f "dotfiles/README.md" ]] && install -Dm644 "dotfiles/README.md" "$pkgdir/usr/share/noctyra/README.md"
  # [[ -f "dotfiles/LICENSE" ]] && install -Dm644 "dotfiles/LICENSE" "$pkgdir/usr/share/noctyra/LICENSE"
}
