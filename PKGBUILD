# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=py3status
pkgver=3.3
pkgrel=2
pkgdesc="An extensible i3status replacement/wrapper written in python"
url="http://www.ultrabug.fr/tag/py3status/"
arch=('any')
license=('custom: Simplified BSD')
depends=('python' 'python-setuptools')
optdepends=('i3status: for some of the functionality'
            'acpi: for some of the battery related modules')
source=($pkgname-$pkgver.tar.gz::"https://github.com/ultrabug/py3status/archive/$pkgver.tar.gz")
sha256sums=('95015a6abab80c0ec4981f12117f85f0bb5b3ab7e1b0024b366b8b085b725628')
source=($pkgname-$pkgver.tar.gz::"https://github.com/ultrabug/py3status/archive/$pkgver.tar.gz"
        'python-36.patch')
sha256sums=('95015a6abab80c0ec4981f12117f85f0bb5b3ab7e1b0024b366b8b085b725628'
            'bb1050a3053339ce2f5edf97da8df44048d4f45f914d9159f7ea75c74af97ff4')

package() {
  cd $pkgname-$pkgver

  # Temporary fix to support Python 3.6 until upstream release
  patch -p0 < $startdir/python-36.patch

  python setup.py install --root="$pkgdir/" --optimize=1
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/* README.rst CHANGELOG "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
