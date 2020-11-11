# Maintainer: David Runge <dvzrv@archlinux.org>

_name=whichcraft
pkgname=python-whichcraft
pkgver=0.6.1
pkgrel=4
pkgdesc="This package provides cross-platform cross-python shutil.which functionality"
arch=('any')
url="https://github.com/cookiecutter/whichcraft"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('85075289ae5cacb8f45a23776fcbbef3f62a4d8bdf110e1d3f9f25fb4ba44117c459d5f42dec7fd7f5c9680963d6aa1c1e31fc5b9fbe6127395698468f8d77fb')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
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
  install -vDm 644 {AUTHORS,CONTRIBUTING,HISTORY,README}.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
