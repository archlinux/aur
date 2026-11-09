# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: alufers <alufers[at]wp[dot]pl>

pkgname=ltchiptool
pkgver=4.15.0
# lightweight tag -> tag is not signed, only the commit
_commit=410874f66b60da1dd667dbba69f499acbf16eb03
pkgrel=1
pkgdesc='Universal, easy-to-use GUI flashing/dumping tool for BK7231, RTL8710B and RTL8720C.'
url='https://github.com/libretiny-eu/ltchiptool'
arch=('any')
license=('MIT')
depends=(
  bk7231tools
  ltchiptool-data
  python
  python-bitstruct
  python-click
  python-colorama
  python-cryptography
  python-datastruct
  python-hexdump
  python-importlib-metadata
  python-prettytable
  python-pycryptodome
  python-requests
  python-semantic-version
  python-typer
  python-wxpython
  python-xmodem
  python-zeroconf
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
validpgpkeys=('A874B6246D23954F506CC60C43037AC62A600562') #  Kuba Szczodrzyński <kuba [this: @] szczodrzynski [and a dot] pl>
source=("${pkgname}-${pkgver}::git+${url}.git#commit=$_commit?signed")
b2sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
