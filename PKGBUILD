# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdappstreamedit
pkgver=9.2
pkgrel=1
pkgdesc="A graphical Program to create and edit AppStream files"
arch=("any")
url="https://codeberg.org/JakobDev/jdAppStreamEdit"
license=("GPL3")
depends=("python" "python-pyqt6" "python-lxml" "python-requests" "appstream")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
optdepends=("python-desktop-entry-lib: Create AppStream files from .desktop files" "appstream-glib: Validate with appstream-util")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdAppStreamEdit/archive/${pkgver}.tar.gz")
sha256sums=("bba33bb35420d59369bb76c406afcafab48cb7a2909fba239c937aa64ad99730")
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
