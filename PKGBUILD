# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>

# This package was updated from: https://aur.archlinux.org/packages/python2-cssmin

pkgname=python-cssmin
_name=cssmin
pkgver=0.2.0
pkgrel=2
arch=('any')
license=('MIT' 'BSD')
pkgdesc='Python port of the YUI CSS compression algorithm. No longer maintained.'
depends=('python')
makedepends=('python-setuptools')
url='https://github.com/zacharyvoase/cssmin'
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
		"https://raw.github.com/zacharyvoase/${_name}/v${pkgver}/LICENSE")
md5sums=('c2798658a4f69663365a3e70c3b8250b'
         '7f9dbc2d22a3975e22fd6ce0f3d6268f')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  # this package contains BSD-licensed parts
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
