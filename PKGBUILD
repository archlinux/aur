# Maintainer: Specter119 <specter119@gmail.com>

pkgname=python-lottie
_name=${pkgname//python-}
pkgver=0.7.2
pkgrel=1
pkgdesc='A Python framework to work with Lottie files and Telegram animated stickers.'
arch=(any)
url=https://pypi.org/project/lottie
license=(AGPL)
groups=(efb)
depends=(python)
makedepends=(python-setuptools)
optdepends=(
  python-pillow
  python-glaxnimate
  python-numpy
  python-cairosvg
  python-fonttools
  python-opencv
  python-grapheme
  python-qscintilla-qt5
  python-coverage
)
replaces=(python-tgs)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz
  0001-Fix-webp-export-on-pillow-12.0.0-or-later.patch
)
sha512sums=('3c220e37898a8af30af1cf5269d7d20888d2b6cae9e5705ce42802a4ef950c7f239c25f38909926f3863a2d0f5a8e73011183f82f1dc97e21bce35c1ced76495'
            '4088ce0226506b4b5b952033e6cf25149a79c1fb8b92856f632262a3922840e2de30126ae7b824ff32b315ec444ef2839082564e725455263ddaf849815ed52a')
prepare() {
	cd $srcdir/${_name}-$pkgver
	patch -Np1 -i ../0001-Fix-webp-export-on-pillow-12.0.0-or-later.patch
}

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root $pkgdir --skip-build --optimize=1
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
