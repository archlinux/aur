# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=1.11.0
pkgrel=1
pkgdesc="Plugin for accessing test session metadata"
arch=('any')
url="https://github.com/pytest-dev/pytest-metadata"
license=('MPL2')
depends=('python-pytest')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('09867df6158ba66f55a0a812b3731b4372f874b6bdc91301ed0c4d4c38f6fe9a4f936006d4e27f8c68d4a2d6b0fe5fedee3c6269bc6867eb1c7d73a42bda0361')
b2sums=('1de1c47b1d7775040075de479722fd07cb187f14cd37c5fe73458fb54ce01653295288fd11add8066170b8dc39f80c8749e739deb01ac8d579ef5e6f4339478d')

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
                          --root="${pkgdir}"
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
