# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=pslab-python
pkgname=python-pslab-git
pkgver=1.0.2
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
conflicts=(python-pslab)
options=(!emptydirs)
source=(git://github.com/fossasia/$_pyname.git)
sha512sums=('SKIP')

package() {
  cd "$srcdir/${_pyname}"
  # strip out attempt to install udev rules
  sed -i "s/.*cmdclass.*/)/" setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 99-pslab.rules "$pkgdir/usr/lib/udev/rules.d/99-pslab.rules"
}

# vim:set ts=2 sw=2 et:
