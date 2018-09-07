# Maintainer: David Runge <dave@sleepmap.de>
_name=husl
pkgname=python-husl
pkgver=4.0.3
pkgrel=3
pkgdesc="A Python implementation of HUSL (revision 3)"
arch=('any')
url="https://pypi.org/project/husl/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('1df5e08b24c3b815e4bf643d8bfc911aeeff25328565123122efb2a7042aea1e6e7709ed9d2c6a42390a0cece98863813a83952964c7df1dfcdc566671858034'
            'd796b5bec7d325a897541d9fd2712fa83bb88babd4744e7ff28202f8db153696660f1d1b2e95f0fee618d98a83ae7fb635e4a412ab9c8de30f0cb27f287a4251')

prepare() {
  mv -v "$_name-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

# tests are not included. upstream contacted
#check() {
#  cd "$pkgname-$pkgver"
#  python setup.py test
#}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  # license file not available. former maintainer contacted
  install -vDm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
