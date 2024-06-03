# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdappstreamedit
pkgver=9.1
pkgrel=1
pkgdesc="A graphical Program to create and edit AppStream files"
arch=("any")
url="https://codeberg.org/JakobDev/jdAppStreamEdit"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml" "python-requests" "appstream")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
optdepends=("python-desktop-entry-lib: Create AppStream files from .desktop files" "appstream-glib: Validate with appstream-util")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdAppStreamEdit/archive/${pkgver}.tar.gz")
sha256sums=("6770a2819a2eff37a6d22fa1eda0ff81188aeda0d793eee4b8a471db59ee01bf")
replaces=("jdappdataedit")

build() {
      cd "jdappstreamedit"
      python -m build --wheel --no-isolation
}

package() {
      cd "jdappstreamedit"
      python -m installer --destdir "$pkgdir" dist/*.whl
      python install-unix-datafiles.py --prefix "${pkgdir}/usr"
      install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
