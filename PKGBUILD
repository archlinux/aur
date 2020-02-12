# Maintainer: Anthony VB <anthonyvbop AT gmail DOT com>

pkgname=python-blinkstick-git
_name=blinkstick
pkgver=20200211
pkgrel=1
pkgdesc="BlinkStick Python interface to control devices connected to the computer."

url='http://www.blinkstick.com'
arch=('any')
license=('custom')
depends=('python-pyusb')

source=("$_name::git+https://github.com/arvydas/blinkstick-python.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_name}/"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
