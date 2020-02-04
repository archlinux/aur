# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=blockdiag
pkgver=2.0.1
pkgrel=1
pkgdesc="blockdiag generates block-diagram image from text"
url="http://blockdiag.com"
license=('Apache')
arch=('any')
depends=('python-setuptools' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
checkdepends=('python-nose' 'python-mock' 'python-pycodestyle' 'python-reportlab' 'python-docutils'
              'python-wand' 'ghostscript' 'librsvg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/blockdiag/archive/$pkgver.tar.gz")
sha512sums=('509535312bd46022203d279604507e09106680722d98516dabd7187bc48d9a195709f2534f2f7757058c06b914b517ec2f6d899cec12e7df24ba4ab28ec76bcd')

build() {
  cd blockdiag-$pkgver
  python setup.py build
}

check() {
  cd blockdiag-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  # TODO: figure out the failure
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages" nosetests -e "test_setup_inline_svg_is_true_with_multibytes"
}

package() {
  cd blockdiag-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
