# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Crass00 <crass00 @ hotmail . com>

pkgname=python2-backports.entry-points-selectable
pkgver=1.1.0
pkgrel=2
pkgdesc="Compatibility shim providing selectable entry points for older implementations"
arch=('any')
url="https://github.com/jaraco/backports.entry_points_selectable"
license=('MIT')
depends=('python2-backports')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest')
source=("https://pypi.io/packages/source/b/backports.entry-points-selectable/backports.entry_points_selectable-$pkgver.tar.gz")
sha512sums=('86c794899cac2f916b36388fd071a619ef27743ac94f0bb058e6157d02481109088ed7891c7775c2f859b92150315acce9052b04ae000363c54af052fbf50ea7')

prepare() {
  cd backports.entry_points_selectable-$pkgver
  # No idea how this is supposed to work (FS#71629)
  sed -i "/\\[metadata\\]/a version=$pkgver" setup.cfg
}

build() {
  cd backports.entry_points_selectable-$pkgver
  python2 setup.py build
}

check() {
  cd backports.entry_points_selectable-$pkgver
  python2 -m pytest
}

package() {
  cd backports.entry_points_selectable-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  rm "$pkgdir"/usr/lib/python2.7/site-packages/backports/__init__.py*
}
