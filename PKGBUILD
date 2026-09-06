pkgname=lufux-git
pkgver=1.3.5
pkgrel=1
pkgdesc="Minimalist GUI tool to create bootable USB drives"
arch=('any')
url="https://github.com/Advnirr/lufux"
license=('GPL3')
depends=('python-gobject' 'gtk4' 'libadwaita' 'wimlib' 'rsync' 'parted' 'polkit' 'dosfstools' 'ntfs-3g')
makedepends=('git')
provides=('lufux')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "${pkgdir}/usr/share/lufux"
  
  install -Dm755 "main.py" "${pkgdir}/usr/share/lufux/main.py"
  install -Dm644 "windows_logic.py" "${pkgdir}/usr/share/lufux/windows_logic.py"
  install -Dm644 "windows_togo_logic.py" "${pkgdir}/usr/share/lufux/windows_togo_logic.py"
  install -Dm644 "bcd_logic.py" "${pkgdir}/usr/share/lufux/bcd_logic.py"
  install -Dm644 "speed_logic.py" "${pkgdir}/usr/share/lufux/speed_logic.py"
  install -Dm644 "universal_logic.py" "${pkgdir}/usr/share/lufux/universal_logic.py"
  install -Dm644 "deps_logic.py" "${pkgdir}/usr/share/lufux/deps_logic.py"

  install -Dm644 "lufux.desktop" "${pkgdir}/usr/share/applications/lufux.desktop"
  install -Dm644 "lufux.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lufux.svg"
}
