# Maintainer: uriel <no public email for you>

_pkgname=quark-engine
pkgname=quark-engine
pkgver=23.2.1
pkgrel=1
pkgdesc='An Obfuscation-Neglect Android Malware Scoring System'
arch=('any')
license=('GPL')
url='https://github.com/quark-engine/quark-engine'
depends=('python' 'python-prettytable' 'python-androguard' 'python-tqdm' 'python-colorama' 'python-graphviz' 'python-prompt-toolkit' 'python-plotly' 'python-rzpipe' 'python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8dba29cda97a4b86d60677130fbcaa71533f3a6443faff5335150ffe66eb7bac')

prepare() {
    # Hacky way to prevent it from installing tests to site-packages
    cd "${srcdir}/${pkgname}-${pkgver}"
    rm -r tests
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

