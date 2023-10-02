# Maintainer: Fernando Ortiz <nandub+arch [at] nandub.info>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=python-pyalsaaudio-git
pkgname=(python-pyalsaaudio-git)
_pkgname=pyalsaaudio
pkgver=0.9.2.r17.g67adbf0
pkgrel=1
pkgdesc="ALSA wrappers for Python (development version)"
arch=('i686' 'x86_64')
url="http://larsimmisch.github.io/pyalsaaudio/"
license=('custom: PSF')
makedepends=('python-setuptools' 'alsa-lib')
source=("git+https://github.com/larsimmisch/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

build() {
  # build for python 3
  cd ${_pkgname}
  python setup.py build
}

# package for python 3
package_python-pyalsaaudio-git() {
  depends=('python' 'alsa-lib')
  pkgdesc="${pkgdesc/Python/Python 3}"
  conflicts=('python-pyalsaaudio')
  provides=('python-pyalsaaudio')

  cd ${_pkgname}

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
