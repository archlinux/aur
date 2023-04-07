# Maintainer: David Runge <dvzrv@archlinux.org>

_name=git-url-parse
pkgname=python-git-url-parse
pkgver=1.2.2
pkgrel=5
pkgdesc="A simple GIT URL parser"
arch=('any')
url="https://github.com/coala/git-url-parse"
license=('MIT')
depends=('python-pbr')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mock' 'yapf')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('d9a1633fd08b2d4bbd33ff886776906d2981f53178e295fb9907fdb261e863e2b70293d962962355b96ea156e17bb7e224497a4a708c8d9d0cc559d111fa188b')

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
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
