# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname="python-files-vc"
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="Python files.vc API wrapper and command line interface"
arch=('any')
url="https://github.com/Sasivarnasarma/Files-VC"
license=('MIT')
provides=('files-vc' 'filesvc')
options=(!debug)
depends=('python>=3.7' 'python-requests' 'python-requests-toolbelt' 'python-tabulate')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("files-vc.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8294b8206967f1b95c1abde8cae7104a6ef36cd80a7c5bd1bd6f456375105fb060ed0b71f2d3201a4a81f9ae6fee5784becafc55491e127b676a59b947749cf6')

build() {
  cd ${url##*/}-${pkgver}
  python -m build
}

package() {
  cd ${url##*/}-${pkgver}
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
