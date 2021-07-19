# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: William Turner <willtur.will@gmail.com>
pkgname='python-fontmath'
_pkgname=fontMath
pkgver=0.8.1
pkgrel=1
pkgdesc='A set of objects for performing math operations on font data.'
arch=('any')
url='https://github.com/robotools/fontMath'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-fonttools')
checkdepends=('python-pytest')
options=(!emptydirs)
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.zip"
    "install.patch")
sha256sums=('39d71e8b7eeb33c0ddc25e94c1ae64bf29340aeea443f4327392f2be38175f54'
            '12aff8540624a75b549dedf9483da84c9e66bca165a021d57be9f3469071baca')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../install.patch
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}

check() {
  cd "$_pkgname-$pkgver"
  PYTHONPATH=Lib pytest Lib/fontMath/test
}
