# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=python-pyalsaaudio-git
pkgname=(python-pyalsaaudio-git python2-pyalsaaudio-git)
pkgver=0.8.2.r0.g5cbc886
pkgrel=1
pkgdesc="ALSA wrappers for Python (development version)"
arch=('i686' 'x86_64')
url="http://larsimmisch.github.io/pyalsaaudio/"
license=('custom: PSF')
makedepends=('python-setuptools' 'python2-setuptools' 'alsa-lib')
source=("git+https://github.com/larsimmisch/pyalsaaudio.git")
md5sums=('SKIP')

pkgver() {
  cd pyalsaaudio
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup pyalsaaudio python-pyalsaaudio
  cp -rup pyalsaaudio python2-pyalsaaudio
}

build() {
  # build for python 3
  cd python-pyalsaaudio
  python setup.py build

  # build for python 2
  cd ../python2-pyalsaaudio
  python2 setup.py build
}

# package for python 3
package_python-pyalsaaudio-git() {
  depends=('python' 'alsa-lib')
  pkgdesc="${pkgdesc/Python/Python 3}"
  conflicts=('python-pyalsaaudio')
  provides=('python-pyalsaaudio')

  cd python-pyalsaaudio

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# package for python 2
package_python2-pyalsaaudio-git() {
  depends=('python2' 'alsa-lib')
  pkgdesc="${pkgdesc/Python/Python 2}"
  conflicts=('python2-pyalsaaudio')
  provides=('python2-pyalsaaudio')

  cd python2-pyalsaaudio

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
