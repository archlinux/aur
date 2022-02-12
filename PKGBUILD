# Contributor: Sascha Shaw <sascha.shaw@t-online.de>
_base=odfpy
pkgname=(python-${_base}-git ${_base}-git)
pkgbase=python-${_base}-git
pkgver=1.4.2
pkgrel=1
arch=(any)
url="https://github.com/eea/${_base}.git"
license=(GPL)
makedepends=(git python-setuptools)
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd ${_base}
  python setup.py build
}

package_python-odfpy-git() {
  pkgdesc='A python library for manipulating OpenDocument 1.2 files'
  depends=(python)
  conflicts=(python-${_base} python2-${_base})

  cd ${_base}
  python setup.py install --root="${pkgdir}/" --skip-build
  rm -rf ../tools-{bin,share}
  mv "${pkgdir}"/usr/bin ../tools-bin
  mv "${pkgdir}"/usr/share ../tools-share
}

package_odfpy-git() {
  pkgdesc='Tools for manipulating OpenDocument 1.2 files'
  depends=(python-${_base}-git)

  install -Dt "${pkgdir}"/usr/bin/ "${srcdir}"/tools-bin/*
  install -Dt "${pkgdir}"/usr/share/man/man1/ "${srcdir}"/tools-share/man/man1/*
}
