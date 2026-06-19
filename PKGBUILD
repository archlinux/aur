# Maintainer: Milan <your-email@example.com>
pkgname=arch-backup-tool-git
_pkgname=arch-backup
pkgver=r17.530e505
pkgrel=1
pkgdesc="PyQt6 GUI and CLI package baseline/dotfile tracking and recovery tool for Arch Linux & CachyOS"
arch=('any')
url="https://github.com/kosirm/arch-backup"
license=('MIT')
depends=('python' 'python-pyqt6' 'git' 'pacman' 'chezmoi')
makedepends=('git')
optdepends=(
  'konsave: KDE Plasma desktop configuration backup'
  'flatpak: Tracking installed flatpaks'
)
provides=('arch-backup-tool' 'cachyos-backup' 'cachyos-recovery')
conflicts=('arch-backup-tool' 'cachyos-backup' 'cachyos-recovery')
install=arch-backup-tool-git.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  # Run installer under fakeroot using DESTDIR and PREFIX=/usr
  PREFIX=/usr DESTDIR="${pkgdir}" ./install.sh
}
