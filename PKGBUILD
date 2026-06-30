# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname="python-files-vc"
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="Python files.vc API wrapper and command line interface (archived)"
arch=('any')
url="https://github.com/Sasivarnasarma/Files-VC"
license=('MIT')
provides=('files-vc' 'filesvc')
options=(!debug)
depends=('python>=3.7' 'python-requests' 'python-requests-toolbelt' 'python-tabulate')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("files-vc.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('dc9b0710aaa79057f648eec364e56c07f0dcb2a0b3d6efc291263d9c40f5b36ca8d196e366382cc3c2f3a4cfde166175c6b7f70dc4f489955f2c1a3b3e0eeec3')

build() {
  cd ${url##*/}-${pkgver}
  python -m build
}

package() {
  cd ${url##*/}-${pkgver}
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
