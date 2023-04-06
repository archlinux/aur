# Maintainer: David Runge <dave@sleepmap.de>
_name=xvfbwrapper
pkgname=python-xvfbwrapper
pkgver=0.2.9
pkgrel=10
pkgdesc="Manage headless displays with Xvfb (X virtual framebuffer)"
arch=('any')
url="https://github.com/cgoldberg/xvfbwrapper"
license=('MIT')
depends=('python' 'xorg-server-xvfb')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('800f3489b2e1bbc884d7651e344ed73783d6c00856f3ab7ccfa6b9058dd6d3bb98d38f11172ba89dff5773d6c5b773bc000786c1f6c6aae5a27179b37017851e')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  py.test
}

package_python-xvfbwrapper() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --root="${pkgdir}/"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
