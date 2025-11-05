# Maintainer: Cristóbal Tapia <crtapia at gmali dot com>

pkgname="wofi-pubs"
_pkgname="wofi_pubs"
pkgver=0.10.4
pkgrel=1
pkgdesc='A wofi interface for the reference manager pubs'
url='https://github.com/cristobaltapia/wofi-pubs'
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools' 'python-wofi'
         'dpt-rp1-py' 'pygobject-devel')
makedepends=('uv' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cristobaltapia/wofi-pubs/archive/v${pkgver}.tar.gz")
sha256sums=('d06bffd41e6d28c9d30dbb435f7e05875795d6cd7db6b9d214fc60cabb8be0bc')

prepare() {
    echo ${pkgname}-${pkgver}
    cd "${pkgname}-${pkgver}"
    uv build
    # cd "$pkgname-$pkgver"
    # dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  tar xf ${_pkgname}-${pkgver}.tar.gz
  cd ${_pkgname}-${pkgver}
  # python setup.py build
  uv build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/contrib/wofi-pubs.service" ${pkgdir}/usr/lib/systemd/user/wofi-pubs.service
}

# vim:set ft=sh ts=2 sw=2 et:

