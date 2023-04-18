# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdflatpaksnapshot
pkgver=2.0
pkgrel=1
pkgdesc="A Program to create Snapshots of Flatpak Apps"
arch=("any")
url="https://codeberg.org/JakobDev/jdFlatpakSnapshot"
license=("GPL3")
depends=("python" "python-pyqt6" "python-desktop-entry-lib")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "gettext")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdFlatpakSnapshot/archive/${pkgver}.tar.gz")
sha256sums=("b0c7fd29c676098c07f68d6815223fac86ec339425e161ab59d7c004a37c3f42")

build() {
      cd "jdflatpaksnapshot"
      python -m build --wheel --no-isolation
}

package() {
      cd "jdflatpaksnapshot"
      python -m installer --destdir "$pkgdir" dist/*.whl
      python install-unix-datafiles.py --prefix "${pkgdir}/usr"
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
 
