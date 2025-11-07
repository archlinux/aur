# Maintainer: Sanjaya Danushka <dsanjaya712@gmail.com>
pkgname=neoarch-git
pkgver=1.0.beta.1.r0.g0000000
pkgrel=1
pkgdesc="NeoArch Package Manager for Arch Linux"
arch=('any')
url="https://github.com/Sanjaya-Danushka/Aurora"
license=('custom')
depends=('python-pyqt6' 'python-requests' 'qt6-svg' 'git' 'flatpak' 'nodejs' 'npm')
makedepends=('git')
provides=('neoarch')
conflicts=('neoarch')
source=('git+https://github.com/Sanjaya-Danushka/Aurora.git')
md5sums=('SKIP')

pkgver() {
  cd Aurora
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/Aurora"
  # Install to /opt/neoarch
  install -d "$pkgdir/opt/neoarch"
  cp -r . "$pkgdir/opt/neoarch/"
  # Make scripts executable
  chmod +x "$pkgdir/opt/neoarch/install_arch_deps.sh"
  chmod +x "$pkgdir/opt/neoarch/bin/neoarch.sh"
  chmod +x "$pkgdir/opt/neoarch/install_desktop_entry.sh"
  # Install desktop file
  install -Dm644 aurora.desktop "$pkgdir/usr/share/applications/neoarch.desktop"
  sed -i 's|/home/test/New Folder/Aurora|/opt/neoarch|g' "$pkgdir/usr/share/applications/neoarch.desktop"
  # Install icon
  install -Dm644 assets/icons/discover/logo1.png "$pkgdir/usr/share/pixmaps/neoarch.png"
}
