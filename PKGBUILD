# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=docutils-stubs
pkgname=python-$_pkgname
pkgver=0.0.21
pkgrel=3
pkgdesc='PEP 561 based Type information for docutils'
arch=('any')
url='https://github.com/tk0miya/docutils-stubs'
license=('custom:Unlicense')
depends=('python' 'python-docutils')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/tk0miya/docutils-stubs/1f13dcdbebb06bc742b797bc5765a70d734a7fbc/LICENSE')
sha512sums=('b469dd35cd9934fc9c53ec3a62b473fbcfb230d42dc501d202da4c8be0e1ee2aef8c2722824cb191f9814aa3f12f773113bda96e4aa35d0b28efd1a6d76656f1'
            'f23a3f3ec79340594ea40d731087e8586326a96c6cb9675c7a58687255885148286aa73cee087a5a3c976ea901fde16e229d00e98c65188cce3f0d75c8390a10')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # remove docutils dependency pin
  sed -i '/docutils/d' "$pkgdir"/usr/lib/python*/site-packages/docutils_stubs-*.egg-info/requires.txt

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
