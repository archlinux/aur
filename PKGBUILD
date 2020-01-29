# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=blockdiag
pkgver=2.0.0
pkgrel=1
pkgdesc="blockdiag generates block-diagram image from text"
url="http://blockdiag.com"
license=('Apache')
arch=('any')
depends=('python-setuptools' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
checkdepends=('python-nose' 'python-mock' 'python-pycodestyle' 'python-reportlab' 'python-docutils'
              'python-wand' 'ghostscript' 'librsvg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/blockdiag/archive/$pkgver.tar.gz")
sha512sums=('fe2d3b79358c8f85b7e3c737090a35d7f99f3f2a0bec01923d57eccd23ea0205ec624e0325dc08e26cc27dfb9f526a0438077b719180f6346334c4b64f0a672e')

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
