# Maintainer: Sanjaya Danushka <dsanjaya712@gmail.com>
pkgname=neoarch-git
pkgver=1.2.beta
pkgrel=1
pkgdesc="NeoArch Package Manager for Arch Linux"
arch=('any')
url="https://github.com/Sanjaya-Danushka/Neoarch"
license=('MIT')
depends=('python-pyqt6' 'python-requests' 'qt6-svg' 'git' 'flatpak' 'nodejs' 'npm')
makedepends=('git')
provides=('neoarch')
conflicts=('neoarch')
install=neoarch-git.install
source=('git+https://github.com/Sanjaya-Danushka/Neoarch.git')
md5sums=('SKIP')

pkgver() {
  cd Neoarch
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"
  # Install to /opt/neoarch
  install -d "$pkgdir/opt/neoarch"
  cp -r Neoarch "$pkgdir/opt/neoarch/"
  # Make scripts executable
  chmod +x "$pkgdir/opt/neoarch/Neoarch/install_arch_deps.sh"
  chmod +x "$pkgdir/opt/neoarch/Neoarch/bin/neoarch.sh"
  chmod +x "$pkgdir/opt/neoarch/Neoarch/install_desktop_entry.sh"
  # Install desktop file
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/aurora.desktop" "$pkgdir/usr/share/applications/neoarch.desktop"
  sed -i 's|/home/test/New Folder/Aurora|/opt/neoarch/Neoarch|g' "$pkgdir/usr/share/applications/neoarch.desktop"
  # Install icon
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/assets/icons/NeoarchLogo.svg" "$pkgdir/usr/share/pixmaps/neoarch.svg"
  # Install license
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

