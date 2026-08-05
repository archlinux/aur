# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>

pkgname=python-qemu-qmp
pkgver=0.0.6
pkgrel=1
pkgdesc='QEMU Monitor Protocol library'
arch=('any')
url='https://gitlab.com/qemu-project/python-qemu-qmp'
license=('LGPL-2.0-or-later' 'GPL-2.0-only')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
  'python-pygments: qmp-tui text user interface'
  'python-urwid: qmp-tui text user interface'
  'python-urwid-readline: qmp-tui text user interface'
)
source=("https://files.pythonhosted.org/packages/source/q/qemu.qmp/qemu_qmp-${pkgver}.tar.gz")
b2sums=('ef408e6cd6bf5209824e75dd1d942b7ec6e3e5d258a1052ed4ce3661d8ced53c45414849c509e46638b1dff61b0acc581475024e318d76e4c63e9f1b79913e1b')

build() {
  cd "qemu_qmp-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "qemu_qmp-${pkgver}"
  PYTHONPATH="${PWD}" pytest
}

package() {
  cd "qemu_qmp-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 LICENSE LICENSE_GPL2 -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
