
# Maintainer: rpizerow2-rgb <rpizerow2@gmail.com>
pkgname=pmgui
pkgver=1.1.2
pkgrel=2
pkgdesc="A lightweight, zero-confirmation GUI for Arch Linux package management and AUR"
arch=("any")
url="https://github.com/rpizerow2-rgb/pmgui"
license=("MIT")
depends=("python" "python-pyqt6" "yay" "polkit")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rpizerow2-rgb/pmgui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  # Installa il pacchetto python python standard
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # FORZIAMO la copia del file .desktop nel sistema per farlo apparire nei menu!
  mkdir -p "$pkgdir/usr/share/applications"
  cp pmgui.desktop "$pkgdir/usr/share/applications/" 2>/dev/null || cp "${pkgname}-${pkgver}/pmgui.desktop" "$pkgdir/usr/share/applications/"
}
