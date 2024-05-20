# Maintainer: William Turner <willtur.will@gmail.com>

pkgname=python-ledgercomm
_name="${pkgname#python-}"
pkgver=1.2.1
pkgrel=2
pkgdesc="Library to communicate with Ledger Nano S/X and Speculos."
arch=('any')
url="https://github.com/LedgerHQ/ledgercomm"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build'
             'python-installer'
             'python-setuptools-scm>=6.2'
             'python-setuptools>=45'
             'python-tomli'
             'python-wheel')
optdepends=('python-hidapi>=0.9.0.post3: HID interface communication')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('015cfc05f16b8c59f8cc1d9fc0b8935923f1fcc3806d33eeb6b0e055b44f5a91')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="$pkgdir" \
    "./dist/${_name}-${pkgver}-py3-none-any.whl"
}
