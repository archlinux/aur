# Maintainer: Paul Irofti <paul@irofti.net>
_name=kymatio
pkgname="python-$_name"
pkgver=0.2.0
pkgrel=2
pkgdesc="Wavelet scattering in Python"

arch=('any')
url="http://spams-devel.gforge.inria.fr/"
license=('GPLv3')

depends=('python' 'python-numpy' 'python-scipy' 'python-appdirs'
  'python-configparser' 'python-packaging')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('32fbb2b5c1ceeeadc30029d6d9d4590a35052cc7c685cf2bb049690708bd3dfb')

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
