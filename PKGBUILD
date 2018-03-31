# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Adapterd from Arch Strike for stable version and moved to AUR:
# Original Maintainer: ArchStrike <team@archstrike.org>

_pkgname=stem
pkgbase=python-${_pkgname}
pkgname=(python-${_pkgname} python2-${_pkgname})
pkgver=1.6.0
pkgrel=1
pkgdesc='A controller library for Tor'
conflicts=('python-stem-git')
arch=('any')
url='https://stem.torproject.org/'
license=('LGPL3')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/11/d5/e51983f81b38408ae2f0e166481ad867962f6fa07610fe71119534e12d41/stem-${pkgver}.tar.gz")
sha256sums=('d7fe1fb13ed5a94d610b5ad77e9f1b3404db0ca0586ded7a34afd323e3b849ed')


prepare() {
  mv ${_pkgname}-${pkgver} ${pkgname}
  cp -a ${pkgname}{,-py2}
}

build() {
  cd "$srcdir/${pkgname}"
  python3 setup.py build

  cd "$srcdir/${pkgname}-py2"
  python2 setup.py build
}

package_python-stem() {
  depends=('python')

  cd "$srcdir/${pkgname}"
  python3 setup.py install --root="${pkgdir}/" -O1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # fix duplicate file issue with tor_prompt
  mv $pkgdir/usr/bin/tor-prompt $pkgdir/usr/bin/tor-prompt3
}

package_python2-stem() {
  depends=('python2')

  cd "$srcdir/python-stem-py2"
  python2 setup.py install --root="${pkgdir}/" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

