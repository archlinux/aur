# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.6.1
pkgrel=1
pkgdesc="Python's missing debug print command and other development tools."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pytest' 'python-pytest-mock' 'python-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/samuelcolvin/python-devtools/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('42d0300bce141d3ab7b2b222bc7f67d135985046e2f2b5b93cbee55801eddb93'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('b8c69ebe100e2f64a4a443f536697ff055563ac833630e04568b30ff6a887375cd009b846e0932b71c0ffdf48cdae311b571b0df9fd03096e744f5e35f9ac555'
        '5c26d1be5d4ee3c05ac90a8118a23de7ebde909290075cc7c1df4acab355f06417e5a32052f56e313ddaa7cc16d4cfb721c9931dffe58105917180bcae40b719')

build() {
  cd "python-devtools-${pkgver}"

  python setup.py build
}

check() {
  cd "python-devtools-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py pytest
}

package() {
  cd "python-devtools-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
