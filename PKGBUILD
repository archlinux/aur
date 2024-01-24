# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdflatpaksnapshot
pkgver=2.2
pkgrel=2
pkgdesc="A Program to create Snapshots of Flatpak Apps"
arch=("any")
url="https://jakobdev.codeberg.page/work/app/jdFlatpakSnapshot"
license=("GPL3")
depends=("python" "python-pyqt6" "python-desktop-entry-lib")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "gettext")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdFlatpakSnapshot/archive/${pkgver}.tar.gz")
sha256sums=("849d4d14249982a69ac690ac7ca5e18caaeda95678783c91482607d4b18e6da8")

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
 
