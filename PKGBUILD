# Maintainer: David Runge <dvzrv@archlinux.org>

_name=poyo
pkgname=python-poyo
pkgver=0.5.0
pkgrel=7
pkgdesc="A lightweight YAML Parser for Python"
arch=('any')
url="https://github.com/hackebrot/poyo"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('aad4334a2aaf63cafab0ecdbdd6f94e9e3d412e6476d7ac13a4399b4af0f43b1eb910e6a3cc7438e84262bc39413fadbe91674534e1e66f446d738c1328b9905')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build/lib:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CHANGES,COMMUNITY,CONTRIBUTING,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
