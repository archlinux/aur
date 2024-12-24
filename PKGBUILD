# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>

pkgname=konsave
pkgver=2.2.0
pkgrel=5
pkgdesc='Save and apply your KDE Plasma customizations with just one command!'
url=https://github.com/Prayag2/konsave
depends=(
  python-pyaml
  python-setuptools
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
license=(GPL-3.0-or-later)
arch=(any)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c9f513fb0ff4bad477765e91614295d120af349c6e60f4116ae8a7e0bd205958adc3fa01034183c6d18c127dcb730a93883527053a334496bc16b829cc22aa24')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  cd ${pkgname}-${pkgver}
  python -m build \
    --wheel \
    --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  # Copying configuration files
  local _python_folder=$(python -c 'import site; print(site.getsitepackages()[0])')
  install -Dm644 -t "${pkgdir}"/${_python_folder}/${pkgname} konsave/conf_{kde,other}.yaml
}

# vim: ts=2 sw=2 et:
