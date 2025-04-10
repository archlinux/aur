# Maintainer: Cem Kaya<cemkaya.boun@gmail.com>
# Contributor: Cem Kaya <cemkaya.boun@gmail.com>
pkgname=dell-g15-controller
pkgname_alt=dell-g-series-controller
pkgver=4.1
pkgrel=1
pkgdesc="AWCC alternative for Dell G15/G16 with keyboard backlight control, power mode control and fan control."
arch=('x86_64')
url="https://github.com/cemkaya-mpi/Dell-G-Series-Controller"
license=('GPLv3')
groups=()
depends=('python' 'python-pyusb' 'pyside6' 'python-pexpect' 'polkit')
makedepends=()
optdepends=('acpi_call: For power and fan speed options.' 'polkit: for privilege escalation')
provides=()
conflicts=(dell-g15-controller)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname_alt}_${pkgver}::https://github.com/cemkaya-mpi/Dell-G-Series-Controller/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('8644e8d78439da1c37d725b46f3bea019a316669fcdaa4e5f8f00df3db0e2517')

package() {
  cd "${srcdir}/Dell-G-Series-Controller-$pkgver"
  #Create Directories
  install -d "$pkgdir/opt/$pkgname_alt/"
  install -d "$pkgdir/etc/udev/rules.d/"
  install -d "$pkgdir/usr/share/applications/"
  #Udev rule
  cp "00-aw-elc.rules" "$pkgdir/etc/udev/rules.d/00-aw-elc.rules"
  #Copy files
  cp "awelc.py" "$pkgdir/opt/$pkgname_alt/awelc.py"
  cp "elc_constants.py" "$pkgdir/opt/$pkgname_alt/elc_constants.py"
  cp "elc.py" "$pkgdir/opt/$pkgname_alt/elc.py"
  cp "hidreport.py" "$pkgdir/opt/$pkgname_alt/hidreport.py"
  cp "main.py" "$pkgdir/opt/$pkgname_alt/main.py"
  cp "patch.py" "$pkgdir/opt/$pkgname_alt/patch.py"
  #Install desktop entry
  cp "dell-g-series-controller.desktop" "$pkgdir/usr/share/applications/"

#   make DESTDIR="$pkgdir/" install
}
