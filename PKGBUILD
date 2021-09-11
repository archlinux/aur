# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-branca
_pkgname=branca
pkgver=0.4.2
pkgrel=1
pkgdesc="Generate html+js with Python."
arch=('any')
url="https://github.com/python-visualization/branca"
license=('MIT')
checkdepends=('jupyter-nbconvert' 'python-nose' 'python-selenium' 'geckodriver')
depends=('python' 'python-jinja')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-visualization/branca/archive/v$pkgver.tar.gz")
sha256sums=('4d4ab6e800caac8f92dd070fa4375e62a0dfbd8b20cfa9a0d35c474318e9e711')

check() {
    cd "$_pkgname-$pkgver"
    nosetests
}

prepare() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
