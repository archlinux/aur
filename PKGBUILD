# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=docutils-stubs
pkgname=python-$_pkgname
pkgver=0.0.20
pkgrel=3
pkgdesc='PEP 561 based Type information for docutils'
arch=('any')
url='https://github.com/tk0miya/docutils-stubs'
license=('custom:Unlicense')
depends=('python' 'python-docutils')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/tk0miya/docutils-stubs/1f13dcdbebb06bc742b797bc5765a70d734a7fbc/LICENSE')
sha512sums=('a46a4efed4c9c33720022caa7493167a47d399edb7e9e4897126f830a48153899c63a2f45a985ce88d4ea22f4a18d0a8bfe78049f7ab04544f8a19c69cdc04c7'
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
