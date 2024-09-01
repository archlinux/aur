# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tomli
pkgname=pypy3-${_base}
pkgver=1.0.4
pkgrel=1
pkgdesc="A lil' TOML parser"
arch=(any)
url="https://github.com/hukkin/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-setuptools python-dephell)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('e30e06ea805c94359596c3d6db82464ccafcdde0172cae12d62c889c70986159b3198cf465183854bef1b048c21e487c2b0dad2825e2477d363885e749b238ee')

prepare() {
  cd ${_base}-${pkgver}
  # https://gitlab.archlinux.org/archlinux/packaging/packages/python-tomli/-/blob/1.0.4-1/PKGBUILD#L18
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd ${_base}-${pkgver}
  pypy3 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
