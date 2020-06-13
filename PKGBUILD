# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=pslab-python
pkgname=python-pslab
pkgver=1.0.1
pkgrel=1
pkgdesc="Core library for PSlab desktop"
arch=('any')
url="https://pslab.io"
license=('GPL3')
depends=(
  'python'
  'python-setuptools'
  'python-pyserial'
  'python-numpy'
)
provides=("$_pyname")
options=(!emptydirs)
source=(https://github.com/fossasia/$_pyname/archive/v$pkgver.tar.gz)
sha512sums=('939f3649a0060a59a39ee97b57134075f8602b966fb3d14250c8ae96c340a4ab33e9fa8d7c5d8cf09ae9297b762c203e4a256bc29b9ff6006ce6ff254c468ad2')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  # strip out attempt to install udev rules
  sed -i "/cmdclass/d" setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 99-pslab.rules "$pkgdir/usr/lib/udev/rules.d/99-pslab.rules"
}

# vim:set ts=2 sw=2 et:
