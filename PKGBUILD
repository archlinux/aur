# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Zhang.j.k <zhangjk67 at gmail dian com>

pkgname=konsave
pkgver=2.2.0
pkgrel=2
pkgdesc='Save and apply your KDE Plasma customizations with just one command!'
url=https://github.com/Prayag2/${pkgname}
depends=(python-pyaml)
makedepends=(python-setuptools-scm)
license=(GPL3)
arch=(any)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=(c9f513fb0ff4bad477765e91614295d120af349c6e60f4116ae8a7e0bd205958adc3fa01034183c6d18c127dcb730a93883527053a334496bc16b829cc22aa24)

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install \
    --root="${pkgdir}" \
    --optimize=1 \
    --skip-build

  # Copying configuration files
  _python_folder=$(python -c 'import site; print(site.getsitepackages()[0])')
  install -Dm644 konsave/conf_kde.yaml "${pkgdir}"/${_python_folder}/${pkgname}/conf_kde.yaml
  install -Dm644 konsave/conf_other.yaml "${pkgdir}"/${_python_folder}/${pkgname}/conf_other.yaml
}

# vim: ts=2 sw=2 et:
