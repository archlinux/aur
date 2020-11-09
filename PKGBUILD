# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgbase=python-pyalsaaudio
pkgname=(python-pyalsaaudio python2-pyalsaaudio)
pkgver=0.9.0
pkgrel=1
pkgdesc="ALSA wrappers for Python"
arch=('i686' 'x86_64' 'armv7h')
url="http://larsimmisch.github.io/pyalsaaudio/"
license=('custom: PSF')
makedepends=('python-setuptools' 'python2-setuptools' 'alsa-lib')
source=("https://files.pythonhosted.org/packages/source/p/pyalsaaudio/pyalsaaudio-$pkgver.tar.gz")
md5sums=('48c40424a79c2568676a41643d93f1f7')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup pyalsaaudio-$pkgver py2alsaaudio-$pkgver
}

build() {
  # build for python 3
  cd pyalsaaudio-$pkgver
  python setup.py build

  # build for python 2
  cd ../py2alsaaudio-$pkgver
  python2 setup.py build
}

# package for python 3
package_python-pyalsaaudio() {
  depends=('python' 'alsa-lib')
  pkgdesc+=" 3"

  cd pyalsaaudio-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# package for python 2
package_python2-pyalsaaudio() {
  depends=('python2' 'alsa-lib')
  pkgdesc+=" 2"

  cd py2alsaaudio-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
