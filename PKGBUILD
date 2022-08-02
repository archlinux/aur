# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=check_smartmon-git
pkgver=r43.66ec3f3
pkgrel=1
pkgdesc="Nagios-Plugin that uses smartmontools (http://smartmontools.sourceforge.net/) to check disk health status and temperature."
arch=('any')
url="https://github.com/driehuis/Nagios_check_smartmon"
license=('GPL2')
depends=('python-psutil' 'smartmontools')
makedepends=('git')
source=("${pkgname}::git+https://github.com/driehuis/Nagios_check_smartmon.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install License
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Put code files into '/usr/share'
  install -Dm755 "$pkgname/check_smartmon.py" "$pkgdir/usr/share/check_smartmon/check_smartmon.py"

  # Install binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/check_smartmon/check_smartmon.py" "${pkgdir}/usr/bin/check_smartmon"
}
