# Maintainer: ada tessar <cmdada@proton.me>
pkgname=mayflash-w012-linux-updater-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="A Linux GUI firmware updater and analysis tool for the Mayflash W012 GameCube Controller Adapter"
arch=('any')
url="https://github.com/cmdada/mayflash-w012-linux-updater"
license=('GPL')
depends=('python' 'python-hidapi' 'python-pyusb' 'tk')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/cmdada/mayflash-w012-linux-updater.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  
  # Install the main scripts
  install -Dm755 w012_updater_gui.py "$pkgdir/usr/bin/mayflash-w012-updater"
  install -Dm755 mayflash_tool.py "$pkgdir/usr/bin/mayflash-w012-cli"
  
  # Install the udev rule
  install -Dm644 99-mayflash-w012.rules "$pkgdir/usr/lib/udev/rules.d/99-mayflash-w012.rules"
  
  # Install the desktop file
  install -Dm644 mayflash-w012-updater.desktop "$pkgdir/usr/share/applications/mayflash-w012-updater.desktop"
  
  # Install the documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
