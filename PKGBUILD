# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdappstreamedit
pkgver=10.0
pkgrel=1
pkgdesc="A graphical Program to create and edit AppStream files"
arch=("any")
url="https://codeberg.org/JakobDev/jdAppStreamEdit"
license=("GPL3")
depends=("python" "python-pyqt6" "python-appstream-python" "python-lxml" "python-requests" "appstream")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "qt6-tools")
optdepends=("python-desktop-entry-lib: Create AppStream files from .desktop files" "appstream-glib: Validate with appstream-util")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdAppStreamEdit/archive/${pkgver}.tar.gz")
sha512sums=("af0091eb4928656a9448a24389806d2554e29d20b5f573588940c87d689140dd4912500d86f74f2f2e65d05589b0b0c09996bb218e5a24b23be1f3e2d9220907")
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
