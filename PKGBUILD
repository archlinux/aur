# Maintainer: Paul Irofti <paul@irofti.net>
_name=kymatio
pkgname="python-$_name"
pkgver=0.2.1
pkgrel=1
pkgdesc="Wavelet scattering in Python"

arch=('any')
url="https://www.kymat.io/"
license=('GPLv3')

depends=('python' 'python-numpy' 'python-scipy' 'python-appdirs'
  'python-configparser' 'python-packaging')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('67b7f57c881f17c260aa7659261ea2975b2feec9a09b8c46327533c589e0953c')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  sed -i s,requirements.txt,${_name}.egg-info\/requires.txt, setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
