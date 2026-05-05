pkgname=lufus-git
pkgver=1.1.5
pkgrel=1
pkgdesc="Minimalist GUI tool to create bootable USB drives"
arch=('any')
url="https://github.com/Advnirr/lufus"
license=('GPL3')
depends=('python-gobject' 'gtk4' 'libadwaita' 'wimlib' 'rsync' 'parted' 'polkit' 'libarchive')
makedepends=('git')
provides=('lufus')
conflicts=('lufus')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "${pkgdir}/usr/share/lufus"
  
  install -Dm755 "main.py" "${pkgdir}/usr/share/lufus/main.py"
  install -Dm644 "windows_logic.py" "${pkgdir}/usr/share/lufus/windows_logic.py"
  install -Dm644 "universal_logic.py" "${pkgdir}/usr/share/lufus/universal_logic.py"
  
  install -Dm644 "lufus.desktop" "${pkgdir}/usr/share/applications/lufus.desktop"
  install -Dm644 "lufus.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lufus.svg"
}
